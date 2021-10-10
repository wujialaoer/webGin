package DictManage

type Alias struct {
	Id           string `json:"id,omitempty" gorm:"id;primaryKey"`
	StandardName string `json:"standard_name,omitempty" gorm:"standard_name"`
	AliasItems   string `json:"alias_items,omitempty" gorm:"alias_items"`
}
