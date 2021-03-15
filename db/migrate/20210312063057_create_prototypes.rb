class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string     :title
      t.text       :catch_copy
      t.text       :concept
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
