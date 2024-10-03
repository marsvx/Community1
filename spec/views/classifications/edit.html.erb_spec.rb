require 'rails_helper'

RSpec.describe "classifications/edit", type: :view do
  let(:classification) {
    Classification.create!()
  }

  before(:each) do
    assign(:classification, classification)
  end

  it "renders the edit classification form" do
    render

    assert_select "form[action=?][method=?]", classification_path(classification), "post" do
    end
  end
end
