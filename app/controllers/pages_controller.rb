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
end
