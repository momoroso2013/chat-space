# DB設計

## users table

| Column | Type   | Options                                  |
|:-----:|:------:|:----------------------------------------:|
| name  | string | null: false, unique: true, index: true   |

### Association
 * has_many :groups through: :group_users
 * has_many :messages
 * has_many :group_users



## groups table

| Column | Type | Options     |
|:-----:|:----:|:-----------:|
| name  | text | null: false |

### Association
 * has_many users through: :group_users
 * has_many messages
 * has_many group_users


## group_users table

| Column    | Type    | Options |
|:--------:|:-------:|:-------:|
| group_id | references | foreign_key: true |
| user_id  | references | foreign_key: true |

### Association
 * belongs_to user
 * belongs_to group



## messages table

| Column    | Type    | Options                        |
|:--------:|:-------:|:------------------------------:|
| text     | string  |                                |
| image    | string    |                                |
| user_id  | references | null: false, foreign_key: true |
| group_id | references | null: false, foreign_key: true |

### Association
 * belongs_to user
 * belongs_to group

