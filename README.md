#DB設計

##users table

|Colum|Type|Options|
|name|string|null: false, unique: true, index: true|
|mail|string|null: false, unique: true|


##group table
|Colum|Type|Options|
|group_id|integer||
|user_id|integer||

##message table

|Colum|Type|Options|
|text |string||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
