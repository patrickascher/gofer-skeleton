package main

import (
	"github.com/patrickascher/gofer-skeleton/backend"
	"github.com/patrickascher/gofer-skeleton/backend/routes"
	_ "github.com/patrickascher/gofer-skeleton/backend/translation"
	_ "github.com/patrickascher/gofer/auth/native"
	"github.com/patrickascher/gofer/config"
	"github.com/patrickascher/gofer/config/viper"
	_ "github.com/patrickascher/gofer/locale/translation/db"
	_ "github.com/patrickascher/gofer/query/mysql"
	_ "github.com/patrickascher/gofer/router/jsrouter"

	"github.com/patrickascher/gofer/server"
)

func main() {
	var err error

	// load config
	cfg := backend.Config{}
	err = config.Load(config.VIPER, &cfg, viper.Options{FileName: "config.json", FilePath: ".", FileType: "json"})
	if err != nil {
		panic(err)
	}

	// create a new server instance
	err = server.New(cfg)
	if err != nil {
		panic(err)
	}

	// add routes
	err = routes.RegisterRoutes()
	if err != nil {
		panic(err)
	}

	// start server
	err = server.Start()
	if err != nil {
		panic(err)
	}
	defer func() {
		err = server.Stop()
		if err != nil {
			panic(err)
		}
	}()
}
