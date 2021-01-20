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



| product listing function        |  
| ---                             |  
| image (ActiveStorageで実装)      |  
| name (string型 NOT NULL)        |  
| description (string型 NOT NULL) |  
| category_id (integer型)         |  
| condition_id (integer型)        |  
| charges_id (integer型)          |  
| area_id (integer型)             |  
| ship_id (integer型)             |  
| price (integer型 NOT NULL)      |  



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

  
  
  
### Association  
- belongs_to :user  
- has_many :product listing functions  