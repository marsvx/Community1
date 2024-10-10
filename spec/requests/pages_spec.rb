require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /about_us" do
    it "returns http success" do
      get "/pages/about_us"
      expect(response).to have_http_status(:success)
    end
  end

end
