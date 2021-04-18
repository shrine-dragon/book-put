# テーブル設計

## users テーブル

|         Column         |   Type  |          Options          |
|------------------------|---------|---------------------------|
|        nickname        |  string |       null: false         |
|        gender_id       | integer |       null: false         |
|        birth_day       |   date  |       null: false         |
|          email         |  string | null: false, unique: true |
|   encrypted_password   |  string |       null: false         |

### Association

- has_one  :questionnaire
- has_many :books
- has_many :comments

## questionnaires テーブル

|         Column        |    Type    |            Options             |
|-----------------------|------------|--------------------------------|
|       category_id     |   integer  |          null: false           |
|        genre_id       |   integer  |          null: false           |
|   purchase_place_id   |   integer  |          null: false           |
|    reading_media_id   |   integer  |          null: false           |
|         user          | references |  null: false, optional: true   |

### Association

- belongs_to :user

## books テーブル

|       Column       |    Type    |            Options             |
|--------------------|------------|--------------------------------|
|        title       |   string   |          null: false           |
|     category_id    |   integer  |          null: false           |
|      genre_id      |   integer  |          null: false           |
|     catch_copy     |   string   |          null: false           |
|       content      |    text    |          null: false           |
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