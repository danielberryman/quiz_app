class AddQuestionIndexToOptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :options, :question, foreign_key: true
  end
end
