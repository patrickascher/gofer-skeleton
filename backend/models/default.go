package models

import (
	"time"

	"github.com/patrickascher/gofer/cache"
	"github.com/patrickascher/gofer/orm"
	"github.com/patrickascher/gofer/query"
	"github.com/patrickascher/gofer/server"
)

type Base struct {
	orm.Model
	ID int
}

func (b Base) DefaultCache() (cache.Manager, time.Duration) {
	c, err := server.Caches()
	if err != nil || len(c) < 1 {
		return nil, cache.DefaultExpiration
	}
	return c[0], cache.NoExpiration
}

func (b Base) DefaultBuilder() query.Builder {
	db, err := server.Databases()
	if err != nil || len(db) < 1 {
		return nil
	}
	return db[0]
}
