package controller

import (
	"github.com/patrickascher/gofer-skeleton/backend/models"
	"github.com/patrickascher/gofer/controller"
	"github.com/patrickascher/gofer/grid"
)

type TestController struct {
	controller.Base
}

type Test struct {
	models.Base
	Name string
}

func (t *TestController) Test() {

	g, err := grid.New(t, grid.Orm(&Test{}))
	if err != nil {
		t.Error(500, err)
		return
	}

	g.Field("Name").SetRemove(false)
	g.Field("Name").SetRemove(grid.NewValue(false))

	g.Render()
}
