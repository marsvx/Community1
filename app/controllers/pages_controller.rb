class PagesController < ApplicationController
  def home
    @events = Event.where(status: "approved")
      .where(date: Date.today.beginning_of_week..Date.today.end_of_week)
  end
  
  def food
    session[:explore_category] = 'food'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'FOOD' })
  end

  def housing
    session[:explore_category] = 'housing'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'HSG' })
  end

  def healthcare
    session[:explore_category] = 'healthcare'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'HLTH' })
  end

  def education
    session[:explore_category] = 'education'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'EDU' })
  end

  def childcare
    session[:explore_category] = 'childcare'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'CHLD' })
  end

  def legal_resources
    session[:explore_category] = 'legal_resources'
    @organizations = Organization.joins(:categories).where(categories: { abbv: 'LEGL' })
  end
  
  def survey
    survey = Survey.new
  
    if survey.save
      @survey_service = SurveyService.new(survey.id)
      # Preload data needed for the survey view
      @questions = Question.includes(:answers)
    else
      flash[:error] = "Survey could not be created: #{survey.errors.full_messages.join(", ")}"
      redirect_to root_path # Use a valid path here
    end
  end
end  