# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | --------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| birthday           | date    | null: false               |

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

## commentsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| store  | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :store