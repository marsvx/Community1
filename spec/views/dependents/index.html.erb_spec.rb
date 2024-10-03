require 'rails_helper'

RSpec.describe "dependents/index", type: :view do
  before(:each) do
    assign(:dependents, [
      Dependent.create!(),
      Dependent.create!()
    ])
  end

  it "renders a list of dependents" do
    render
    cell_selector = 'div>p'
  end
end
