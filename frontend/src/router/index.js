import Vue from 'vue'
import VueRouter from 'vue-router'
import {DashLayout, GridLayout, LoginLayout, UserService} from 'gofer-vue'

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'Login',
        meta: {isPublic: true},
        component: LoginLayout
    },
    {
        path: '/dash',
        component: DashLayout,
        children: [
            {
                path: 'roles',
                component: GridLayout,
                name: 'Dashboard Orders',
                meta: {description: 'Overview of environment', api: '/settings/roles'},
                children: [
                    {
                        path: '*',
                        component: GridLayout,
                        name: '',
                        meta: {
                            description: 'Overview of environment',
                            api: '/settings/roles'
                        }
                    }
                ]
            },
            {
                path: 'routes',
                component: GridLayout,
                name: 'Dashboard Orders',
                meta: {description: 'Overview of environment', api: '/settings/routes'},
                children: [
                    {
                        path: '*',
                        component: GridLayout,
                        name: '',
                        meta: {
                            description: 'Overview of environment',
                            api: '/settings/routes'
                        }
                    }
                ]
            },
            {
                path: 'navigation',
                component: GridLayout,
                name: 'Dashboard Orders',
                meta: {description: 'Overview of environment', api: '/settings/navigations'},
                children: [
                    {
                        path: '*',
                        component: GridLayout,
                        name: '',
                        meta: {
                            description: 'Overview of environment',
                            api: '/settings/navigations'
                        }
                    }
                ]
            },
            {
                path: 'accounts',
                component: GridLayout,
                name: 'Dashboard Orders',
                meta: {description: 'Overview of environment', api: '/settings/accounts'},
                children: [
                    {
                        path: '*',
                        component: GridLayout,
                        name: '',
                        meta: {
                            description: 'Overview of environment',
                            api: '/settings/accounts'
                        }
                    }
                ]
            },
            {
                path: 'test',
                component: GridLayout,
                name: 'Dashboard test',
                meta: {description: 'Overview of environment', api: '/test'},
                children: [
                    {
                        path: '*',
                        component: GridLayout,
                        name: '',
                        meta: {
                            description: 'Overview of environment',
                            api: '/test'
                        }
                    }
                ]
            }
        ]
    }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router

router.beforeEach((to, from, next) => {

    //catching logout route
    console.log(to.path)

    if (to.path === process.env.VUE_APP_URL_LOGOUT) {
        UserService.logout().then(() => {
            next(process.env.VUE_APP_URL_LOGIN);
        }).catch(() => {
            next(process.env.VUE_APP_URL_LOGIN);
        });
        return
    }

    // Allow public urls
    if (to['meta']['isPublic'] === true) {
        // check on the Login route if the user is already logged in
        if (to.path === process.env.VUE_APP_URL_LOGIN && UserService.initUser() !== null) {
            next(UserService.redirectAfterLoginPath());
            return
        }
        next();
        return
    }

    // allow logged in users (decoded jwt token)
    if (UserService.getUser() !== null || UserService.initUser() !== null) {
        next();
        return
    }

    // not logged in
    UserService.setRedirectPath(to.path);
    next(process.env.VUE_APP_URL_LOGIN);

});
