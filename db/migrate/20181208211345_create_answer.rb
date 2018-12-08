class CreateAnswer < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :result, foreign_key: true
      t.references :question, foreign_key: true
      t.boolean :correct
    end
  end
end
