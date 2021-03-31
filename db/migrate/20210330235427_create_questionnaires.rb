class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.integer    :book_category_id,  null: true
      t.integer    :book_genre_id,     null: true
      t.integer    :purchase_place_id, null: true
      t.integer    :reading_type_id,   null: true
      t.references :user,          optional: true
      t.timestamps
    end
  end
end
