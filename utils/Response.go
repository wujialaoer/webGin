package utils

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func Response(ctx *gin.Context, code int, msg string, v interface{}) {
	ctx.JSON(http.StatusOK, map[string]interface{}{
		"code":    code,
		"message": msg,
		"data":    v,
	})
}
func PageResponse(ctx *gin.Context, code int, msg string, v interface{}, page int, pageSize int, total int) {
	ctx.JSON(http.StatusOK, map[string]interface{}{
		"code":    code,
		"message": msg,
		"data": map[string]interface{}{
			"data":       v,
			"pageCount":  page,
			"pageSize":   pageSize,
			"totalCount": total,
		},
	})
}
