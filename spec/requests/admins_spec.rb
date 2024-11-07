require 'rails_helper'

RSpec.describe "/administrator/admins", type: :request do
  # This should return the minimal set of attributes required to create a valid Admin.
  # As you add validations to Admin, be sure to adjust the attributes here as well.
  let(:valid_attributes) {
    {
      username: "validusername",
      email: "valid@example.com",
      password: "password123",
      password_confirmation: "password123"
    }
  }

  let(:invalid_attributes) {
    {
      username: "",  # Invalid username
      email: "invalidemail",  # Invalid email format
      password: "short",  # Password too short
      password_confirmation: "short"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Admin.create! valid_attributes
      get administrator_admins_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      admin = Admin.create! valid_attributes
      get administrator_admin_url(admin)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_administrator_admin_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      admin = Admin.create! valid_attributes
      get edit_administrator_admin_url(admin)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin" do
        expect {
          post administrator_admins_url, params: { admin: valid_attributes }
        }.to change(Admin, :count).by(1)
      end

      it "redirects to the created admin" do
        post administrator_admins_url, params: { admin: valid_attributes }
        expect(response).to redirect_to(administrator_admin_url(Admin.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin" do
        expect {
          post administrator_admins_url, params: { admin: invalid_attributes }
        }.to change(Admin, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post administrator_admins_url, params: { admin: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          username: "newusername",
          email: "new@example.com"
        }
      }

      it "updates the requested admin" do
        admin = Admin.create! valid_attributes
        patch administrator_admin_url(admin), params: { admin: new_attributes }
        admin.reload
        expect(admin.username).to eq("newusername")
        expect(admin.email).to eq("new@example.com")
      end

      it "redirects to the admin" do
        admin = Admin.create! valid_attributes
        patch administrator_admin_url(admin), params: { admin: new_attributes }
        admin.reload
        expect(response).to redirect_to(administrator_admin_url(admin))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        admin = Admin.create! valid_attributes
        patch administrator_admin_url(admin), params: { admin: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin" do
      admin = Admin.create! valid_attributes
      expect {
        delete administrator_admin_url(admin)
      }.to change(Admin, :count).by(-1)
    end

    it "redirects to the admins list" do
      admin = Admin.create! valid_attributes
      delete administrator_admin_url(admin)
      expect(response).to redirect_to(administrator_admins_url)
    end
  end
end
