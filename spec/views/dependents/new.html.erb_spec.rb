require 'rails_helper'

RSpec.describe "dependents/new", type: :view do
  before(:each) do
    assign(:dependent, Dependent.new())
  end

  it "renders new dependent form" do
    render

    assert_select "form[action=?][method=?]", dependents_path, "post" do
    end
  end
end
