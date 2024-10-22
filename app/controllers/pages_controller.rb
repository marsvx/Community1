class PagesController < ApplicationController
  
  def about_us
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
