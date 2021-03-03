package routes

import (
	"github.com/patrickascher/gofer-skeleton/backend/controller"
	"github.com/patrickascher/gofer/auth"
	"github.com/patrickascher/gofer/router"
	"github.com/patrickascher/gofer/router/middleware"
	"github.com/patrickascher/gofer/router/middleware/jwt"
	"github.com/patrickascher/gofer/server"
)

func RegisterRoutes() error {

	// get server router
	r, err := server.Router()
	if err != nil {
		return err
	}

	// add JWT and RBAC secure middleware
	cfg, err := server.ServerConfig()
	if err != nil {
		return err
	}
	if cfg.Auth.JWT.Alg != "" {

		j, err := jwt.New(cfg.Auth.JWT, &auth.Claim{})
		if err != nil {
			return err
		}
		j.CallbackGenerate = auth.JWTGenerateCallback
		j.CallbackRefresh = auth.JWTRefreshCallback

		rbac := middleware.NewRbac(auth.Rbac{})
		err = auth.BuildRouteGuard()
		if err != nil {
			return err
		}

		r.SetSecureMiddleware(router.NewMiddleware(j.MW, rbac.MW))

		err = server.SetJWT(j)
		if err != nil {
			return err
		}
	}

	// load auth providers
	for p, config := range cfg.Auth.Providers {
		err = auth.ConfigureProvider(p, config)
		if err != nil {
			return err
		}
	}

	// add routes
	t := controller.TestController{}
	err = r.AddPublicRoute(router.NewRoute("/test/*grid", &t, router.NewMapping(nil, t.Test, nil)))
	if err != nil {
		return err
	}

	err = auth.AddRoutes(r)
	if err != nil {
		return err
	}

	return nil
}
