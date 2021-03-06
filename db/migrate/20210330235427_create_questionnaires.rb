class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.integer    :category_id,       null: false
      t.integer    :genre_id,          null: false
      t.integer    :purchase_place_id, null: false
      t.integer    :reading_media_id,  null: false
      t.references :user,          optional: true
      t.timestamps
    end
  end
end
