export default function auth({ next, store }) {
    if (!store.state.isAuthenticated) {
        return next({
            name: 'login'
        })
    }
    return next()
};
