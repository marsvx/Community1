class AddAnswerIdToAnswer < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :answer_ID, :string
  end
end
