class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :quiz, foreign_key: true
      t.string :name
    end
  end
end
