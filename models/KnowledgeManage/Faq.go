package KnowledgeManage

import "time"

type Faq struct {
	Id                   string    `json:"id,omitempty" gorm:"id;primaryKey"`
	FaqPackageId         string    `json:"faq_package_id,omitempty" gorm:"faq_package_id"`
	Problem              string    `json:"problem,omitempty" gorm:"problem"`
	Answer               string    `json:"answer,omitempty" gorm:"answer"`
	FaqType              int       `json:"faq_type,omitempty" gorm:"faq_type"`
	LastModifierId       string    `json:"last_modifier_id" gorm:"last_modifier_id"`
	LastModificationTime time.Time `json:"last_modification_time" gorm:"last_modification_time"`
}
