require 'rails_helper'

RSpec.describe "dependents/show", type: :view do
  before(:each) do
    assign(:dependent, Dependent.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
