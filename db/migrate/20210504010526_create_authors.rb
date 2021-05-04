class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthdate
      t.string :nationality
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
