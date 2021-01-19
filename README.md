# furimaアプリのER図

| user                                |  
| ---                                 |  
| nickname (string型 NOT NULL)        |  
| email (string型 NOT NULL)           |  
| password (string型 NOT NULL)        |  
| first_name (string型 NOT NULL)      |  
| last_name (string型 NOT NULL)       |  
| first_name_kana (string型 NOT NULL) |  
| last_name_kana (string型 NOT NULL)  |  
| birth_day (date型_NOT NULL)         |  

  
  
  
### Association  
- has_many :product listing functions  
- has_many :product purchase functions  



| product listing function         |  
| ---                              |  
| image (ActiveStorageで実装)       |  
| name (string型 NOT NULL)         |  
| description (string型 NOT NULL)  |  
| category (string型 NOT NULL)     |  
| condition (string型 NOT NULL)    |  
| charges (string型 NOT NULL)      |  
| area (string型 NOT NULL)         |  
| ship (string型 NOT NULL)         |  
| price (string型 NOT NULL)        |  



### Association  
- belongs_to :user  
- has_many :product purchase functions  



| product purchase function          |  
| ---                                |  
| card (string型 NOT NULL)           |  
| expiration_date (string型 NOT NULL)|  
| security_code (string型 NOT NULL)  |  
| post_code (string型 NOT NULL)      |  
| prefecture (string型 NOT NULL)     |  
| city (string型 NOT NULL)           |  
| address (string型 NOT NULL)        |  
| building_name (string型)           |  
| phone_number (string型 NOT NULL)   |  

  
  
  
### Association  
- belongs_to :user  
- has_many :product listing functions  