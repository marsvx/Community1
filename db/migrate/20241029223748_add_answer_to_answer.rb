class AddAnswerToAnswer < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :answer, :string
  end
end
