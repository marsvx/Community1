require 'rails_helper'

RSpec.describe "administrator/admins/new", type: :view do
  before(:each) do
    assign(:admin, Admin.new())
  end

  it "renders new admin form" do
    render

    assert_select "form[action=?][method=?]", administrator_admins_path, "post" do
    end
  end
end
