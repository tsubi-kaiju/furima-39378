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
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| price                  | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| shipping_fee_bearer_id | integer    | null: false                    |
| shipping_origin_id     | integer    | null: false                    |
| shipping_duration_id   | integer    | null: false                    |

### Association
- belongs_to :user
- has_one    :purchase_history


## purchase_historiesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| product             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one    :shipping_address


## shipping_addressesテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| purchase_histories    | references | null: false, foreign_key: true |
| postal_code           | string     | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| house_number          | string     | null: false                    |
| building_name         | string     |                                |
| telephone_number      | string     | null: false                    |

### Association
- belongs_to :purchase_history