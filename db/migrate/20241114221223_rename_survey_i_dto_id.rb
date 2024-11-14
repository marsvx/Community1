class RenameSurveyIDtoId < ActiveRecord::Migration[7.1]
  def change
    rename_column :surveys, :surveyID, :id
  end
end
