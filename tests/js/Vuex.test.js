import flushPromises from 'flush-promises';
import axios from 'axios';
import storeConfig from '../../resources/js/components/store/storeConfig.js';

const user = {
  id: 1,
  name: 'Alex',
  email: 'alex@gmail.com'
};
const products = [
  {
    id: 12,
    title: 'Book',
    quantity: 4,
    order_id: 1,
    pivot: { quantity: 4, order_id: 1 }
  },
  {
    id: 13,
    title: 'Another Book',
    quantity: 3,
    order_id: 1,
    pivot: { quantity: 3, order_id: 1 }
  }
];
const rawProducts = [
  { id: 12, title: 'Book', pivot: { quantity: 4, order_id: 1 } },
  { id: 13, title: 'Another Book', pivot: { quantity: 3, order_id: 1 } }
];

describe('store mutations and getters', () => {
  const { state } = storeConfig;
  it('set & clear User', () => {
    const { setUser, clearUser } = storeConfig.mutations;
    const { cartProductsQuantity } = storeConfig.getters;
    state.cartProducts = products;

    setUser(state, user);
    expect(state.user).toEqual(user);
    expect(state.isAuthenticated).toBe(true);
    expect(cartProductsQuantity(state)).toEqual(7);

    clearUser(state);
    expect(state.isAuthenticated).toBe(false);
    expect(state.user).toBeNull();
    expect(state.cartProducts).toEqual([]);
    expect(cartProductsQuantity(state)).toEqual(0);
  });
  it('set & clear cartProducts', () => {
    const { setCartProducts, clearCart } = storeConfig.mutations;
    setCartProducts(state, products);
    expect(state.cartProducts).toEqual(products);
    clearCart(state);
    expect(state.cartProducts).toEqual([]);
  });
});

describe('store actions', () => {
  const MockAdapter = require('axios-mock-adapter');
  const mock = new MockAdapter(axios);
  let state = {};
  beforeEach(() => {
    state = storeConfig.state;
  });
  afterAll(() => {
    mock.restore();
  });

  const commit = jest.fn();
  const dispatch = jest.fn();
  dispatch.mockReturnValue(products);
  const loginParams = { email: 'alex@gmail.com', password: 'password' };
  mock
    .onGet()
    .reply(200, user)
    .onPost('/api/auth/login', loginParams)
    .replyOnce(200, user);

  it('user actions: get user, get cart', async () => {
    const { getUser, setUser } = storeConfig.actions;

    await getUser({ commit, dispatch, state });
    await flushPromises();
    expect(commit).toBeCalledWith('setUser', user);
    expect(dispatch).toBeCalledWith('getCartProducts');

    setUser({ commit }, user);
    expect(commit).toBeCalledWith('setUser', user);

    state.user = user;
    await getUser({ commit, dispatch, state });
    await flushPromises();
    expect(commit).toBeCalledTimes(2);
    expect(dispatch).toBeCalledTimes(1);
  });

  it('login and logout actions', async () => {
    const { login, logout } = storeConfig.actions;

    await login({ commit, dispatch }, loginParams);
    await flushPromises();
    expect(dispatch).toBeCalledWith('getCartProducts');
    expect(commit).toBeCalledWith('setUser', user);

    logout({ commit });
    expect(commit).toBeCalledWith('clearUser');
  });

  it('get cart products and change quantity in actions', async () => {
    mock.reset();
    mock.onGet().reply(200, rawProducts);
    mock.onPost().reply(200, rawProducts);

    const {
      getCartProducts,
      changeCartProductQuantity,
      confirmOrder
    } = storeConfig.actions;

    getCartProducts({ commit });
    await flushPromises();
    expect(commit).toBeCalledWith('setCartProducts', products);
    changeCartProductQuantity({ commit }, { quantityChange: 'increase' });
    await flushPromises();
    expect(commit).toBeCalledWith('setCartProducts', products);

    confirmOrder({ commit });
    expect(commit).toBeCalledWith('clearCart');
  });
});
