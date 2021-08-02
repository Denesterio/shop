import { shallowMount, createLocalVue } from '@vue/test-utils';
import AddtoCartButtonComponent from '../../resources/js/components/AddtoCartButtonComponent.vue';
import VueI18n from 'vue-i18n';
import ru from '../../resources/js/lang/ru';
import { expect } from '@jest/globals';
import flushPromises from 'flush-promises';
import Vuex from 'vuex';

const localVue = createLocalVue();
localVue.use(Vuex);
localVue.use(VueI18n);

const messages = {
  ru
};
const i18n = new VueI18n({
  locale: 'ru', // set locale,
  messages
});

const props = {
  size: 'sm',
  title: 'book title',
  productId: 1
};

const mockSwalFire = jest.fn();
mockSwalFire
  .mockReturnValueOnce(
    new Promise(resolve => {
      resolve({ isConfirmed: true });
    })
  )
  .mockReturnValueOnce(
    new Promise(resolve => {
      resolve({ isDenied: true });
    })
  );
const mockSwal = { fire: mockSwalFire };
const mockRouter = { push: jest.fn() };
const mockRoute = { path: 'localhost:8000/categories/1' };

describe('AddtoCartButtonComponent', () => {
  it('alert for unauthentificated user', async () => {
    const store = new Vuex.Store({
      state: { cartProducts: [] },
      actions: {
        changeCartProductQuantity() {
          return new Promise((_resolve, reject) => {
            reject({ response: { status: 401 } });
          });
        }
      }
    });
    const wrapper = shallowMount(AddtoCartButtonComponent, {
      localVue,
      store,
      i18n,
      propsData: props,
      mocks: {
        $router: mockRouter,
        $swal: mockSwal,
        $route: mockRoute
      }
    });
    jest.spyOn(wrapper.vm, 'changeProductQuantity');

    const cartButton = wrapper.find('#addToCartButton');
    const quantityButton = wrapper.find('#quantityButton');
    const alert = wrapper.find('#alert');

    expect(cartButton.exists()).toBe(true);
    expect(cartButton.text()).toEqual(i18n.t('label.addToCart'));
    expect(quantityButton.exists()).toBe(false);
    expect(alert.exists()).toBe(false);
    await cartButton.trigger('click');
    await flushPromises();
    expect(wrapper.vm.changeProductQuantity).toBeCalledWith(1, 'increase');
    expect(mockSwal.fire).toBeCalled();
    expect(mockRouter.push).toBeCalled();
    await cartButton.trigger('click');
    await flushPromises();
    expect(mockRouter.push).toBeCalledWith({ name: 'register' });
  });

  it('add and delete products', async () => {
    const bookInStore = {
      id: 2,
      quantity: 2,
      title: 'Good Book'
    };
    const store = new Vuex.Store({
      state: {
        cartProducts: [bookInStore]
      },
      actions: {
        changeCartProductQuantity({ commit }, params) {
          if (params.quantityChange === 'increase') {
            return new Promise(resolve => {
              const response = {
                data: [
                  {
                    id: props.productId,
                    quantity: 1,
                    title: props.title
                  },
                  bookInStore
                ]
              };
              commit('setCartProducts', response.data);
              resolve();
            });
          }
          return new Promise(resolve => {
            const data = [bookInStore];
            commit('setCartProducts', data);
            resolve();
          });
        }
      },
      mutations: {
        setCartProducts(state, products) {
          state.cartProducts = products;
        }
      }
    });
    const wrapper = shallowMount(AddtoCartButtonComponent, {
      localVue,
      store,
      i18n,
      propsData: props,
      mocks: {
        $router: mockRouter,
        $swal: mockSwal,
        $route: mockRoute
      }
    });
    jest.spyOn(wrapper.vm, 'changeProductQuantity');

    expect(wrapper.find('#addToCartButton').exists()).toBe(true);
    expect(wrapper.find('#quantityButton').exists()).toBe(false);
    expect(wrapper.vm.quantity).toEqual(0);
    await wrapper.find('#addToCartButton').trigger('click');
    await flushPromises();
    expect(wrapper.vm.changeProductQuantity).toBeCalledWith(1, 'increase');
    expect(wrapper.vm.quantity).toEqual(1);

    expect(wrapper.find('#addToCartButton').exists()).toBe(false);
    expect(wrapper.find('#quantityButton').exists()).toBe(true);
    expect(wrapper.find('#quantityButton').text()).toEqual('1');
    expect(wrapper.find('#alert').isVisible()).toBe(true);
    expect(wrapper.find('#alert').text()).toEqual(
      `"${props.title}" (1) добавлена в корзину`
    );

    await wrapper.find('#descreaseQuantityButton').trigger('click');
    await flushPromises();
    expect(wrapper.vm.changeProductQuantity).toBeCalledWith(1, 'descrease');
    expect(wrapper.vm.quantity).toEqual(0);
    expect(wrapper.find('#addToCartButton').exists()).toBe(true);
    expect(wrapper.find('#quantityButton').exists()).toBe(false);
    expect(wrapper.find('#alert').isVisible()).toBe(true);
    expect(wrapper.find('#alert').text()).toEqual(
      `"${props.title}" (1) удалена из корзины`
    );
  });
});
