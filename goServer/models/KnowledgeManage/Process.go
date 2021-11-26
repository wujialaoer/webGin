package KnowledgeManage

type Process struct {
	Id          string `json:"id,omitempty" gorm:"id;unique;primaryKey"`
	ProcessName string `json:"process_name,omitempty" gorm:"process_name"`
	StartNode   string `json:"start_node,omitempty" gorm:"start_node"`
	EndNode     string `json:"end_node,omitempty" gorm:"end_node"`
	FaqId       string `json:"faq_id,omitempty" gorm:"faq_id"`
}
