package KnowledgeManage

type FaqPackage struct {
	Id             string `json:"id,omitempty" gorm:"id;primaryKey"`
	Name           string `json:"name,omitempty" gorm:"name"`
	BusinessUnitId string `json:"business_unit_id,omitempty" gorm:"business_unit_id"`
}
