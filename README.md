# furimaアプリのER図  

## user  

| Column ｜ Type | Options |  
| ---------- | ------ | ---------- |  
| nickname           | string    | null: false    |  
| email              | string    | null: false    |  
| encrypted_password | string    | null: false    |  
| first_name         | string    | null: false    |  
| last_name          | string    | null: false    |  
| first_name_kana    | string    | null: false    |  
| last_name_kana     | string    | null: false    |  
| birth_day          | date      | null: false    |  

  
  
  
### Association  
- has_many :product listing functi ons  
- has_many :product purchase functions  


## product_listing_function  

| Column ｜ Type | Options |  
| --------- | ------ | ----------- |  
| name          | string      | null: false |  
| description   | text      | null: false |  
| category_id   | integer     | null: false, foreign_key: true |  
| condition_id  | integer     | null: false, foreign_key: true |  
| charges_id    | integer     | null: false, foreign_key: true |  
| area_id       | integer     | null: false, foreign_key: true |  
| ship_id       | integer     | null: false, foreign_key: true |  
| price         | integer     | null: false |  
| user_id       | integer     | null: false, foreign_key: true |  




### Association  
- belongs_to :user  
- has_many :product purchase functions  


## product purchase function  

| Column ｜ Type | Options |  
| --------- | ------ | ----------- |  
| post_code     | string   | null: false    |  
| prefecture_id | integer  | null: false, foreign_key: true |  
| city          | string   | null: false    |  
| address       | string   | null: false    |  
| building_name | string   | null: false    |  
| phone_number  | string   | null: false    |  
| user_id       | integer  | null: false, foreign_key: true |  


  
  
### Association  
- has_one Buyer_history  


## buyer_history

| Column ｜ Type | Options |  
| --------- | ------ | ------------ |  
| user_id    | integer  | null: false, foreign_key: true |  
| product_id | integer  | null: false, foreign_key: true |  
  
  
  
### Association  
- belongs_to :product purchase function  
