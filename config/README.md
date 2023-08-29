## usersテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| nickname            | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| birthday            | date       | null: false                    |

### Association
- has_many :products
- has_many :purchase_histories


## productsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | references | null: false, foreign_key: true |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| price               | int        | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| shipping_fee_bearer | string     | null: false                    |
| shipping_origin     | string     | null: false                    |
| shipping_duration   | string     | null: false                    |

### Association
- belongs_to :users
- has_one    :purchase_histories


## purchase_historiesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | references | null: false, foreign_key: true |
| product_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :products
- has_one    :shipping_addresses


## shipping_addressesテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| purchase_histories_id | references | null: false, foreign_key: true |
| postal_code           | string     | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| house_number          | string     | null: false                    |
| building_name         | string     | null: false                    |
| telephone_number      | string     | null: false                    |

### Association
- belongs_to :purchase_histories