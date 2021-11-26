package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"strings"
	"webGin/config"
	"webGin/controller"
	md "webGin/middleware"
	"webGin/utils"
)

func main() {
	_, err := utils.OrmEngine()
	if err != nil {
		log.Fatal(err.Error())
		return
	}
	app := gin.Default()
	downloadRouter(app)
	app.Use(md.LogMiddleware())
	app.Use(Cors())
	app.Use(md.JwtAuth())
	registerRouter(app)
	app.Run(config.APP_HOST + ":" + config.APP_PORT)
}

func registerRouter(engine *gin.Engine) {
	new(controller.UserController).Router(engine)
	new(controller.KnowledgeManageController).Router(engine)
	new(controller.DictManageController).Router(engine)
}
func downloadRouter(engine *gin.Engine) {
	new(controller.DownloadController).Router(engine)
}

//Cors 跨域
func Cors() gin.HandlerFunc {
	return func(context *gin.Context) {
		method := context.Request.Method
		origin := context.Request.Header.Get("Origin")
		var headerKeys []string
		for k, _ := range context.Request.Header {
			headerKeys = append(headerKeys, k)
		}
		headerStr := strings.Join(headerKeys, ",")
		if headerStr != "" {
			headerStr = fmt.Sprintf("access-control-allow-origin, access-control-allow-headers, %s", headerStr)
		} else {
			headerStr = "access-control-allow-origin, access-control-allow-headers"
		}

		if origin != "" {
			context.Writer.Header().Set("Access-Control-Allow-Origin", "*")
			context.Header("Access-Control-Allow-Origin", "*") // 设置允许访问所有域
			context.Header("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE,UPDATE")
			context.Header("Access-Control-Allow-Headers", "Authorization, Content-Length, X-CSRF-Token, Token,session,X_Requested_With,Accept, Origin, Host, Connection, Accept-Encoding, Accept-Language,DNT, X-CustomHeader, Keep-Alive, User-Agent, X-Requested-With, If-Modified-Since, Cache-Control, Content-Type, Pragma")
			context.Header("Access-Control-Expose-Headers", "Content-Length, Access-Control-Allow-Origin, Access-Control-Allow-Headers,Cache-Control,Content-Language,Content-Type,Expires,Last-Modified,Pragma,FooBar")
			context.Header("Access-Control-Max-Age", "172800")
			context.Header("Access-Control-Allow-Credentials", "false")
			context.Set("content-type", "application/json") //// 设置返回格式是json
		}

		if method == "OPTIONS" {
			context.JSON(http.StatusOK, "Options Request!")
		}
		//处理请求
		context.Next()
	}
}
