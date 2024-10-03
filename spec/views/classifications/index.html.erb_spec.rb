require 'rails_helper'

RSpec.describe "classifications/index", type: :view do
  before(:each) do
    assign(:classifications, [
      Classification.create!(),
      Classification.create!()
    ])
  end

  it "renders a list of classifications" do
    render
    cell_selector = 'div>p'
  end
end
