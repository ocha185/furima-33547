# furimaアプリのER図

| user                                  |  
| ---                                   |  
| nickname (string型 NOT NULL)          |  
| email (string型 NOT NULL)             |  
| encrypted_password (string型 NOT NULL)|  
| first_name (string型 NOT NULL)        |  
| last_name (string型 NOT NULL          |  
| first_name_kana (string型 NOT NULL)   |  
| last_name_kana (string型 NOT NULL)    |  
| birth_day (date型_NOT NULL)           |  

  
  
  
### Association  
- has_many :product listing functions  
- has_many :product purchase functions  



| product listing function                 |  
| ---                                      |  
| image (ActiveStorageで実装)               |  
| name (string型 NOT NULL)                 |  
| description (text型 NOT NULL)            |  
| category_id (integer型 NOT NULL)         |  
| condition_id (integer型 NOT NULL)        |  
| charges_id (integer型 NOT NULL)          |  
| area_id (integer型 NOT NULL)             |  
| ship_id (integer型 NOT NULL              |  
| price (integer型 NOT NULL)               |  
| user_id (integer型 NOT NULL)             |  



### Association  
- belongs_to :user  
- has_many :product purchase functions  



| product purchase function              |  
| ---                                    |  
| post_code (string型 NOT NULL)          |  
| prefecture_id (integer型 NOT NULL)     |  
| city (string型 NOT NULL)               |  
| address (string型 NOT NULL)            |  
| building_name (string型)               |  
| phone_number (string型 NOT NULL)       |  
| user_id (integer型 NOT NULL)           |  

  
  
  
### Association  
- belongs_to :user  
- has_many :product listing functions  
- has_one Buyer_history  
  

| buyer_history                          |  
|---                                     |  
|  user_id(integer型 NOT NULL)           |  
| product_id(integer型 NOT NULL)         |  
  
  
  
### Association  
- belongs_to :user
- belongs_to :product purchase function  
