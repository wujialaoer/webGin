package KnowledgeManage

type Transition struct {
	Id             string `json:"id,omitempty" gorm:"id;unique;primaryKey"`
	ProcessId      string `json:"process_id,omitempty" gorm:"process_id"`
	FromNodeId     string `json:"from_node_id,omitempty" gorm:"from_node_id"`
	ToNodeId       string `json:"to_node_id,omitempty" gorm:"to_node_id"`
	CondExpression string `json:"cond_expression,omitempty" gorm:"cond_expression"`
	Conditions     string `json:"conditions,omitempty" gorm:"conditions"`
	Variable       string `json:"variable,omitempty" gorm:"variable"`
	SourceAnchor   string `json:"source_anchor,omitempty" gorm:"source_anchor"`
}
