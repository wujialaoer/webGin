package KnowledgeManage

// Node
/*

node_types = (
    (0, 'Root'),  # 开始
    (1, 'Problem'),  # 问题
    (2, 'Option'),  # 选项
    (3, 'Answer'),  # 答案
    (4, 'Exit')  # 结束
)
*/
type Node struct {
	NodeId      string  `json:"node_id,omitempty" gorm:"node_id;unique;primaryKey"`
	NodeType    string  `json:"node_type,omitempty" gorm:"node_type"`
	NodeName    string  `json:"node_name,omitempty" gorm:"node_name"`
	Top         float64 `json:"top,omitempty" gorm:"top"`
	Left        float64 `json:"left,omitempty" gorm:"left"`
	Description string  `json:"description,omitempty" gorm:"description"`
	ProcessId   string  `json:"process_id,omitempty" gorm:"process_id"`
}
