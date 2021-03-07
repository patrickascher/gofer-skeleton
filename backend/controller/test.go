package controller

import (
	"github.com/patrickascher/gofer/controller"
	"github.com/patrickascher/gofer/grid"
	"github.com/patrickascher/gofer/orm"
	"github.com/patrickascher/gofer/server"
)

func init() {
	orm.RegisterModel(&Test{})
}

type TestController struct {
	controller.Base
}

type Test struct {
	server.Orm

	ID   int
	Name string
}

func (t *TestController) Test() {

	config := grid.Config{
		Policy:  orm.WHITELIST,
		Action:  grid.Action{DisableCreate: true, DisableDelete: true},
		Exports: []grid.ExportType{grid.CSV},
	}

	g, err := grid.New(t, grid.Orm(&Test{}), config)
	if err != nil {
		t.Error(500, err)
		return
	}

	g.Field("Name").SetRemove(false).SetHidden(grid.NewValue(true).SetUpdate(false).SetDetails(false))
	g.Field("Name").SetRemove(grid.NewValue(false))

	g.Render()
}
