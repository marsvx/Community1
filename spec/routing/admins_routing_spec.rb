require "rails_helper"

RSpec.describe Administrator::AdminsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/administrator/admins").to route_to("administrator/admins#index")
    end

    it "routes to #new" do
      expect(get: "/administrator/admins/new").to route_to("administrator/admins#new")
    end

    it "routes to #show" do
      expect(get: "/administrator/admins/1").to route_to("administrator/admins#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/administrator/admins/1/edit").to route_to("administrator/admins#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/administrator/admins").to route_to("administrator/admins#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/administrator/admins/1").to route_to("administrator/admins#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/administrator/admins/1").to route_to("administrator/admins#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/administrator/admins/1").to route_to("administrator/admins#destroy", id: "1")
    end
  end
end
