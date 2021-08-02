import { shallowMount, createLocalVue } from "@vue/test-utils";
import RegisterComponent from "../../resources/js/components/auth/RegisterComponent.vue";
import VueI18n from "vue-i18n";
import ru from "../../resources/js/lang/ru";
import { expect } from "@jest/globals";
import flushPromises from "flush-promises";
import axios from "axios";
import Vuex from "vuex";

const localVue = createLocalVue();
localVue.use(Vuex);
localVue.use(VueI18n);

const messages = {
  ru
};
const i18n = new VueI18n({
  locale: "ru", // set locale,
  messages
});

const mockStore = { dispatch: jest.fn() };
const mockRouter = { push: jest.fn() };

const wrapper = shallowMount(RegisterComponent, {
  localVue,
  i18n,
  mocks: {
    $store: mockStore,
    $router: mockRouter
  }
});

const button = wrapper.find("#submitButton");
const inputName = wrapper.find("#name");
const inputEmail = wrapper.find("#email");
const inputPassword = wrapper.find("#password");
const inputConfirmPassword = wrapper.find("#confirmPassword");

const rightName = "Loggin";
const rightEmail = "email@email.ru";
const rightPassword = "password";

jest.spyOn(wrapper.vm, "register");

const MockAdapter = require("axios-mock-adapter");
const mock = new MockAdapter(axios);

describe("RegisterComponent.vue", () => {
  afterAll(() => {
    mock.restore();
  });
  beforeEach(() => {
    mock.reset();
  });

  it("empty strings validation", async () => {
    expect(button.attributes("disabled")).toBe("disabled");
    await button.trigger("click");
    expect(wrapper.vm.register).not.toHaveBeenCalled();
  });

  it("password & confirmation dont match, then match, and button is enabled", async () => {
    // набор данных
    // пароли не совпадают, ошибка
    await inputName.setValue("login");
    await inputEmail.setValue("email");
    await inputPassword.setValue("pass");
    await inputConfirmPassword.setValue("pa");
    expect(button.attributes("disabled")).toBe("disabled");
    expect(wrapper.find("#confirmPasswordFeedback").text()).toBe(
      "Пароли не совпадают"
    );

    // пароли совпадают, кнопка разблокирована
    await inputConfirmPassword.setValue("pass");
    expect(button.attributes("disabled")).toBe(undefined);
    expect(wrapper.find("#confirmPasswordFeedback").text()).toBe("");
  });

  it("email validation, wrong, then right", async () => {
    await button.trigger("click");
    expect(wrapper.vm.register).toHaveBeenCalled();
    await flushPromises();
    expect(wrapper.find("#emailFeedback").text()).toBe(i18n.t("error.email"));
    expect(button.attributes("disabled")).toBe("disabled");

    await inputEmail.setValue(rightEmail);
    expect(wrapper.find("#emailFeedback").text()).toBe("");
    expect(button.attributes("disabled")).toBe(undefined);
  });

  it("request with invalid password and name to display server validation error", async () => {
    const errorData = {
      errors: {
        password: ["Пароль должен быть не менее 8 символов"],
        name: ["Такое имя уже используется"]
      }
    };
    mock
      .onPost("/api/auth/register", {
        name: "login",
        email: rightEmail,
        password: "pass",
        password_confirmation: "pass"
      })
      .replyOnce(422, errorData);
    await button.trigger("click");
    await flushPromises();
    expect(wrapper.vm.register).toHaveBeenCalled();
    expect(wrapper.find("#nameFeedback").text()).toBe(
      "Такое имя уже используется"
    );
    expect(wrapper.find("#passwordFeedback").text()).toBe(
      "Пароль должен быть не менее 8 символов"
    );
  });

  it("is button disabled while errors are visible and request with right parameters", async () => {
    // меняем логин, ошибка должна исчезнуть
    await inputName.setValue(rightName);
    expect(wrapper.find("#nameFeedback").text()).toBe("");
    expect(button.attributes("disabled")).toBe("disabled");
    // меняем пароль и подтверждение пароля, ошибок нет, нажатие на кнопку вызовет метод
    await inputPassword.setValue(rightPassword);
    await inputConfirmPassword.setValue(rightPassword);
    expect(wrapper.find("#confirmPasswordFeedback").text()).toBe("");
    expect(button.attributes("disabled")).toBe(undefined);

    // отправляем запрос с правильными параметрами
    const userData = {
      name: rightName,
      id: 1,
      email: rightEmail
    };

    mock
      .onPost("/api/auth/register", {
        name: rightName,
        email: rightEmail,
        password: rightPassword,
        password_confirmation: rightPassword
      })
      .replyOnce(function(config) {
        return [201, userData];
      });
    await button.trigger("click");
    await flushPromises();
    expect(wrapper.vm.register).toHaveBeenCalled();
    expect(mockStore.dispatch).toHaveBeenCalledWith("setUser", userData);
    expect(mockRouter.push).toHaveBeenCalledWith("/");
  });
});
