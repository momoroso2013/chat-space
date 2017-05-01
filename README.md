# DB設計

## users table

| Column | Type   | Options                                  |
|:-----:|:------:|:----------------------------------------:|
| name  | string | null: false, unique: true, index: true   |

### Association
 * has_many :groups through: :group_user
 * has_many :messages
 * accepts_nested_attributes_for :group_users



## groups table

| Column | Type | Options     |
|:-----:|:----:|:-----------:|
| name  | text | null: false |

### Association
 * has_many users through: :group_user
 * has_many messages



## group_users table

| Column    | Type    | Options |
|:--------:|:-------:|:-------:|
| group_id | integer | foreign_key: true |
| user_id  | integer | foreign_key: true |

### Association
 * belongs_to user
 * belongs_to group



## messages table

| Column    | Type    | Options                        |
|:--------:|:-------:|:------------------------------:|
| text     | string  |                                |
| image    | string    |                                |
| user_id  | integer | null: false, foreign_key: true |
| group_id | integer | null: false, foreign_key: true |

### Association
 * belongs_to user
 * balungs_to group

