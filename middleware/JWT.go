package middleware

import (
	"errors"
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"strings"
	"time"
	"webGin/utils"
)

func JwtAuth() gin.HandlerFunc {
	return func(c *gin.Context) {
		if strings.Contains(c.Request.RequestURI, "/token/") {
			return
		}
		if strings.Contains(c.Request.RequestURI, "getAuthority") {
			return
		}
		token := c.Request.Header.Get("Authorization")
		if token == "" {
			utils.Response(c, 401, "请求未携带token，无权限访问", nil)

			c.Abort()
			return
		}
		j := NewJWT()
		claims, err := j.ParseToken(token)
		if err != nil {
			utils.Response(c, 400, err.Error(), nil)
			c.Abort()
			return
		}
		c.Set("claims", claims)
	}
}

type JWT struct {
	SignalKey []byte
}

type CustomClaims struct {
	Id       string `json:"id"`
	Name     string `json:"name"`
	Password string `json:"password"`
	// StandardClaims结构体实现了Claims接口(Valid()函数)
	jwt.StandardClaims
}

func NewJWT() *JWT {
	return &JWT{
		[]byte(GetSignalKey()),
	}
}
func GetSignalKey() string {
	var SignalKey string
	return SignalKey
}

func (j *JWT) GenerateToken(claims CustomClaims) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString(j.SignalKey)
}

func (j *JWT) ParseToken(tokenStr string) (*CustomClaims, error) {
	token, err := jwt.ParseWithClaims(tokenStr, &CustomClaims{}, func(token *jwt.Token) (interface{}, error) {
		return j.SignalKey, nil
	})
	if err != nil {
		if v, ok := err.(*jwt.ValidationError); ok {
			if v.Errors&jwt.ValidationErrorMalformed != 0 {
				return nil, errors.New("不是Token")
			} else if v.Errors&jwt.ValidationErrorExpired != 0 {
				return nil, errors.New("过期Token")
			} else if v.Errors&jwt.ValidationErrorNotValidYet != 0 {
				return nil, errors.New("无效Token")
			} else {
				return nil, errors.New("你猜")
			}
		}
	}
	if claims, ok := token.Claims.(*CustomClaims); ok && token.Valid {
		return claims, nil
	}
	return nil, errors.New("你猜")
}

func (j *JWT) UpdateToken(tokenStr string) (string, error) {

	jwt.TimeFunc = func() time.Time {
		return time.Unix(0, 0)
	}
	token, err := jwt.ParseWithClaims(tokenStr, &CustomClaims{}, func(token *jwt.Token) (interface{}, error) {
		return j.SignalKey, nil
	})
	if claims, ok := token.Claims.(*CustomClaims); ok && token.Valid {
		jwt.TimeFunc = time.Now
		claims.StandardClaims.ExpiresAt = time.Now().Unix() * 60 * 60 * 1000 * 24
		return j.GenerateToken(*claims)

	}
	return "", fmt.Errorf("token获取失败:%v", err)
}

func (j *JWT) GetParseInfo(tokenStr string) (map[string]interface{}, error) {
	parse, err := NewJWT().ParseToken(tokenStr)
	if err != nil {
		return nil, err
	}
	return map[string]interface{}{
		"id":   parse.Id,
		"name": parse.Name,
	}, err
}
