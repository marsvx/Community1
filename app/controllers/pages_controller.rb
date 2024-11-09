class PagesController < ApplicationController
  def home
    @events = Event.where(status: "approved")
      .where(date: Date.today.beginning_of_week..Date.today.end_of_week)
  end

  
  def food
    @organizations = Organization.all
  end

  def housing
    @organizations = Organization.all
  end

  def healthcare
    @organizations = Organization.all
  end

  def education
    @organizations = Organization.all
  end

  def childcare
    @organizations = Organization.all
  end

  def legal_resources
    @organizations = Organization.all
  end

    def survey
      survey = Survey.create(name: "Assistance Survey")
  
      if survey.persisted?
        @survey_service = SurveyService.new(survey.id)
        # Preload data needed for the survey view
        @questions = Question.includes(:answers)
      else
        flash[:error] = "Survey could not be created."
        redirect_to google.com # Choose an appropriate path to redirect to if survey creation fails
      end
    end
end
