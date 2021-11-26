package controller

import (
	"fmt"
	jwtGo "github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
	"net/http"
	"time"
	md "webGin/middleware"
	"webGin/models"
	"webGin/utils"
)

type UserController struct {
}

func (u *UserController) Router(engine *gin.Engine) {
	userRouter := engine.Group("/user")
	userRouter.POST("/token/", u.Login)
	userRouter.POST("/info/", u.UserRoles)
	userRouter.POST("/logout/", u.Logout)
}

// Login 登录，生成Token
func (u *UserController) Login(ctx *gin.Context) {
	var loginUser LoginUser
	ctx.BindJSON(&loginUser)
	admin := new(models.UserInfo)
	has := utils.DbEngine.Where("user_name = ?", loginUser.Name).Find(&admin)
	if has.Error != nil {
		ctx.JSON(http.StatusBadRequest, map[string]interface{}{
			"non_field_errors": "无法使用提供的认证信息登录。",
		})
		panic(has.Error)
		return
	}
	if has.RowsAffected == 0 {
		ctx.JSON(http.StatusBadRequest, map[string]interface{}{
			"message": "用户不存在",
		})
		panic(has.Error)
		return
	}
	if !u.CheckHashPassword(loginUser.Password, admin.Password) {
		ctx.JSON(http.StatusBadRequest, map[string]interface{}{
			"message": "账号或密码错误",
		})
		return
	}
	j := md.NewJWT()
	claims := md.CustomClaims{
		Id:       admin.Id,
		Name:     admin.UserName,
		Password: admin.Password,
		StandardClaims: jwtGo.StandardClaims{
			NotBefore: int64(time.Now().Unix() - 1000),
			ExpiresAt: time.Now().Unix() * 60 * 60 * 1000 * 24,
			Issuer:    "W.Z.h",
		},
	}
	token, err := j.GenerateToken(claims)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, map[string]interface{}{
			"message": "token获取失败",
		})
		return
	}
	md.NewJWT().GetParseInfo(token)
	ctx.JSON(http.StatusOK, map[string]interface{}{
		"token": token,
	})

}

// UserRoles 权限
func (u *UserController) UserRoles(ctx *gin.Context) {
	token := new(Token)
	ctx.BindJSON(token)

	claims, err := md.NewJWT().ParseToken(token.Token)
	fmt.Println("claims", claims)
	if err != nil {
		utils.Response(ctx, 400, err.Error(), token)
		return
	}
	admin := models.UserInfo{UserName: claims.Name}
	has := utils.DbEngine.Where("user_name = ?", claims.Name).Find(&admin)
	if has.Error != nil {
		utils.Response(ctx, 400, "权限获取失败", nil)
		return
	}
	//{"username":"admin","user_id":"31904579-348e-48af-ac33-a1bb59f49099","role":["USER","Sadmin"]}
	role := make([]string, 0)
	switch admin.Role {
	case 0:
		role = append(role, "Sadmin", "Uadmin", "USER")
	case 1:
		role = append(role, "Uadmin", "USER")
	case 2:
		role = append(role, "USER")
	}

	ctx.JSON(http.StatusOK, map[string]interface{}{
		"username": &admin.UserName,
		"user_id":  &admin.Id,
		"role":     role,
	})
}

// Logout 登出
func (u *UserController) Logout(ctx *gin.Context) {
	utils.Response(ctx, 200, "success", nil)
}

func (u *UserController) CheckHashPassword(GetPwd, MyPwd string) bool {

	err := bcrypt.CompareHashAndPassword([]byte(MyPwd), []byte(GetPwd))
	if err != nil {
		return false
	}
	return true
}

// LoginUser 登录
type LoginUser struct {
	Name     string `form:"username" json:"username"`
	Password string `form:"password" json:"password"`
}

// Token token
type Token struct {
	Token string `json:"token,omitempty" form:"token"`
}

func GetCurrentUser(token string) map[string]string {
	claims, err := md.NewJWT().ParseToken(token)
	fmt.Println("claims", claims)
	if err != nil {
		return nil
	}
	admin := models.UserInfo{UserName: claims.Name}
	has := utils.DbEngine.Where("user_name = ?", claims.Name).Find(&admin)
	if has.Error != nil {
		return nil
	}
	return map[string]string{
		"userId":   admin.Id,
		"userName": admin.UserName,
	}
}
