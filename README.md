# DB設計

## users table

| Colum | Type   | Options                                  |
|:-----:|:------:|:----------------------------------------:|
| name  | string | null: false, unique: true, index: true   |
| mail  | string | null: false, unique: true                |

### Association
 *has_many :groups through: :group_user
 *has_many :messages


## groups table

| Colum | Type | Options     |
|:-----:|:----:|:-----------:|
| name  | text | null: false |

### Association
 * has_many users through: :group_user


## group_user table

| Colum    | Type    | Options |
|:--------:|:-------:|:-------:|
| group_id | integer |         |
| user_id  | integer |         |


### Association
 * belongs_to user
 * belongs_to massage

## messages table

| Colum    | Type    | Options                        |
|:--------:|:-------:|:------------------------------:|
| text     | string  |                                |
| image    | text    |                                |
| user_id  | integer | null: false, foreign_key: true |
| group_id | integer | null: false, foreign_key: true |

### Association
 * belongs_to user
