package controller

import (
	"github.com/gin-gonic/gin"
)

type DownloadController struct {
}

func (d *DownloadController) Router(engine *gin.Engine) {
	engine.GET("/download_alias", d.DownloadAlias)
}

// DownloadAlias alisa模板下载
func (d *DownloadController) DownloadAlias(ctx *gin.Context) {
	ctx.Header("Content-Type", "application/octet-stream")
	ctx.Header("Content-Disposition", "attachment; filename="+"Alias.xlsx")
	ctx.Header("Content-Transfer-Encoding", "binary")

	ctx.File("./static/Alias.xlsx")
}
