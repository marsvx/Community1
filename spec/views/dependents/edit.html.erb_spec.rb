require 'rails_helper'

RSpec.describe "dependents/edit", type: :view do
  let(:dependent) {
    Dependent.create!()
  }

  before(:each) do
    assign(:dependent, dependent)
  end

  it "renders the edit dependent form" do
    render

    assert_select "form[action=?][method=?]", dependent_path(dependent), "post" do
    end
  end
end
