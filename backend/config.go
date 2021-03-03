package backend

import (
	"github.com/patrickascher/gofer/server"
)

type Config struct {
	server.Configuration `mapstructure:",squash"`
}
