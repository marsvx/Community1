require 'rails_helper'

RSpec.describe "favorites/edit", type: :view do
  let(:favorite) {
    Favorite.create!()
  }

  before(:each) do
    assign(:favorite, favorite)
  end

  it "renders the edit favorite form" do
    render

    assert_select "form[action=?][method=?]", favorite_path(favorite), "post" do
    end
  end
end
