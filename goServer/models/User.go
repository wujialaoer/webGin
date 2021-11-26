package models

import (
	"time"
)

// UserInfo
//0, 'Sadmin',
//1, 'Uadmin',
//2, 'USER'
///*
type UserInfo struct {
	Id           string    `json:"id,omitempty" gorm:"id;primaryKey"`
	UserName     string    `gorm:"username" json:"username"`
	Password     string    `gorm:"password" json:"password"`
	Role         int       `gorm:"role" json:"role,default:2"`
	CreationTime time.Time `gorm:"creation_time" json:"creation_time"`
	LastLogin    time.Time `gorm:"last_login" json:"last_login"`
}
