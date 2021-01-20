# furimaアプリのER図  

## user  

| Column ｜ Type | Options |  
| ---------- | ------ | ---------- |  
| nickname           | string    | null: false    |  
| email              | string    | null: false,unique: true |  
| encrypted_password | string    | null: false    |  
| first_name         | string    | null: false    |  
| last_name          | string    | null: false    |  
| first_name_kana    | string    | null: false    |  
| last_name_kana     | string    | null: false    |  
| birth_day          | date      | null: false    |  

  
  
### Association  
- has_many :product_listing_functions  
- has_many :buyer_history

## product_listing_function  

| Column ｜ Type | Options |  
| --------- | ------ | ----------- |  
| name          | string      | null: false |  
| description   | text      | null: false |  
| category_id   | integer     | null: false |  
| condition_id  | integer     | null: false |  
| charges_id    | integer     | null: false |  
| prefecture_id | integer     | null: false |  
| ship_id       | integer     | null: false |  
| price         | integer     | null: false |  
| user_id       | integer     | null: false, foreign_key: true |  




### Association  
- belongs_to :user  
- has_one :buyer_history  


## product_purchase_function  

| Column ｜ Type | Options |  
| --------- | ------ | ----------- |  
| post_code     | string   | null: false    |  
| prefecture_id | integer  | null: false, foreign_key: true |  
| city          | string   | null: false    |  
| address       | string   | null: false    |  
| building_name | string   |     |  
| phone_number  | string   | null: false    |  
| buyer_history_id | integer  | null: false, foreign_key: true |  


  
  
### Association  
- belongs_to :buyer_history  


## buyer_history

| Column ｜ Type | Options |  
| --------- | ------ | ------------ |  
| user_id    | integer  | null: false, foreign_key: true |  
| product_id | integer  | null: false, foreign_key: true |  
  
  
  
### Association  
- belongs_to :user  
- belongs_to :product_listing_function  
- has_one :product_purchase_function  
