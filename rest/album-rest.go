package rest

import (
	"github.com/Eswaraa/inflix/controller"
	"github.com/gin-gonic/gin"
)

// SetupRouter - sets the REST routes
func SetupRouter() *gin.Engine {
	r := gin.Default()
	v1 := r.Group("/v1")
	{
		v1.GET("album", controller.GetAlbums)
		v1.POST("album", controller.CreateAlbum)
		v1.GET("album/:id", controller.GetAlbum)
		v1.PUT("album/:id", controller.UpdateAlbum)
		v1.DELETE("album/:id", controller.DeleteAlbum)
	}
	return r
}
