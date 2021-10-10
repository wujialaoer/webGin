package utils

import (
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
	"gorm.io/gorm/schema"
	"webGin/config"
	"webGin/models"
	"webGin/models/DictManage"
	"webGin/models/KnowledgeManage"
)

var DbEngine *gorm.DB

func OrmEngine() (*gorm.DB, error) {
	coon := config.USER + ":" + config.PASSWORD + "@tcp(" + config.DB_HOST + ":" + config.DB_PORT + ")/" + config.DBNAME + "?charset=" + config.CHARSET + "&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(coon), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{SingularTable: true},
		Logger:         logger.Default.LogMode(logger.Info),
	})
	if err != nil {
		panic(err.Error())
		return nil, err
	}

	db.AutoMigrate(&models.UserInfo{},
		&KnowledgeManage.FaqPackage{},
		&KnowledgeManage.Faq{},
		&KnowledgeManage.BusinessUnit{},
		&KnowledgeManage.Process{},
		&KnowledgeManage.Transition{},
		&KnowledgeManage.Node{},
		&DictManage.FilterWords{},
		&DictManage.Alias{},
		&DictManage.Glossary{},
	)
	//pwd, _ := bcrypt.GenerateFromPassword([]byte("admin123"), bcrypt.DefaultCost)
	//db.Create(&models.UserInfo{
	//	Id:           UUID4(),
	//	UserName:     "admin",
	//	Password:     string(pwd),
	//	Role:         0,
	//	CreationTime: time.Now(),
	//	LastLogin:    time.Now(),
	//})
	DbEngine = db
	return db, nil
}
