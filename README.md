# テーブル設計

## usersテーブル

| Column             | Type    | Options                     |
| ------------------ | ------- | ----------------------------|
| nickname           | string  | null: false                 |
| email              | string  | null: false, unique: true   |
| encrypted_password | string  | null: false                 |
| last_name          | string  | null: false                 |
| first_name         | string  | null: false                 |
| birthday           | date    | null: false                 |
| is_deleted         | boolean | null: false, default: false |

### Association

has_many :comments
has_many :stores

## storesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| store_name        | string     | null: false                    |
| description       | text       | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

has_many :comments
belongs_to :user
has_one_attached :image

## active_storage_attachments テーブル

| Column  | Type       | Options                                     |
| ------ | ---------- | -------------------------------------------- |
| name   | string     | null: false                                  |
| record | references | null: false, polymorphic: true, index: false |
| blob   | references | null: false, foreign_key: true               |

## active_storage_blobs テーブル

| Column       | Type   | Options                        |
| ------------ | ------ | ------------------------------ |
| key          | string | null: false                    |
| filename     | string | null: false                    |
| content_type | string |                                |
| metadata     | text   |                                |
| byte_size    | bigint | null: false                    |
| checksum     | string | null: false                    |

## commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| store      | references | null: false, foreign_key: true |
| evaluation | float      |                                |

### Association
belongs_to :user
belongs_to :store