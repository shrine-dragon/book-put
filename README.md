# テーブル設計

## users テーブル

|       Column       |  Type  |          Options          |
|--------------------|--------|---------------------------|
|      nickname      | string |       null: false         |
|      birth_day     |  date  |       null: false         |
|       gender       | string |       null: false         |
|       email        | string | null: false, unique: true |
| encrypted_password | string |       null: false         |

### Association

- has_one  :questionnaire
- has_many :books
- has_many :comments

## questionnaires テーブル

|       Column       |    Type    |            Options             |
|--------------------|------------|--------------------------------|
|   book_category    |   integer  |          null: false           |
|     book_genre     |   integer  |          null: false           |
|   purchase_place   |   integer  |          null: false           |
|    reading_type    |   integer  |          null: false           |
|        user        | references |  null: false, optional: true   |

### Association

- belongs_to :user

## books テーブル

|       Column       |    Type    |            Options             |
|--------------------|------------|--------------------------------|
|        title       |   string   |          null: false           |
|   book_category    |   integer  |          null: false           |
|     book_genre     |   integer  |          null: false           |
|   main_characters  |   string   |                                |
|       summary      |    text    |          null: false           |
|      highlight     |   string   |                                |
|        user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column |    Type    |            Options             |
|--------|------------|--------------------------------|
|  text  |    text    |          null: false           |
|  user  | references | null: false, foreign_key: true |
|  book  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book