package KnowledgeManage

type BusinessUnit struct {
	Id   string `json:"id,omitempty" gorm:"id"`
	Name string `json:"name,omitempty" gorm:"name"`
}
