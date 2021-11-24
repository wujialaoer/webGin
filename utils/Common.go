package utils

import (
	"fmt"
	"sort"
	md "webGin/middleware"
	"webGin/models"
)

func IsHave(strArr []string, str string) bool {
	sort.Strings(strArr)
	index := sort.SearchStrings(strArr, str)
	return index < len(strArr) && strArr[index] == str
}

func GetCurrentUser(token string) map[string]string {
	claims, err := md.NewJWT().ParseToken(token)
	fmt.Println("claims", claims)
	if err != nil {
		return nil
	}
	admin := models.UserInfo{UserName: claims.Name}
	has := DbEngine.Where("user_name = ?", claims.Name).Find(&admin)
	if has.Error != nil {
		return nil
	}
	return map[string]string{
		"userId":   admin.Id,
		"userName": admin.UserName,
	}
}
