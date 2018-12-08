class CreateOption < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :content
      t.boolean :correct
    end
  end
end
