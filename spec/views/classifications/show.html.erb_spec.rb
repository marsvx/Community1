require 'rails_helper'

RSpec.describe "classifications/show", type: :view do
  before(:each) do
    assign(:classification, Classification.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
