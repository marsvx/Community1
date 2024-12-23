module Administrator
  class OrganizationsController < Administrator::BaseController
    before_action :set_organization, only: %i[ show edit update destroy ]
    before_action :set_current_admin

    # GET /organizations or /organizations.json
    def index
      @organizations = Organization.all
    end

    # GET /organizations/1 or /organizations/1.json
    def show
    end

    # GET /organizations/new
    def new
      @organization = Organization.new
    end

    # GET /organizations/1/edit
    def edit
    end

    # POST /organizations or /organizations.json
    def create
      @organization = Organization.new(organization_params)
      @organization.admin_username = Current.admin.username
      @organization.avgStarValue = 0.0

      respond_to do |format|
        if @organization.save
          format.html { redirect_to administrator_organizations_path, notice: "Organization was successfully added." }
          format.json { render :show, status: :created, location: @organization }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @organization.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /organizations/1 or /organizations/1.json
    def update
      respond_to do |format|
        if @organization.update(organization_params)
          format.html { redirect_to administrator_organizations_path, notice: "Organization was successfully updated." }
          format.json { render :show, status: :ok, location: @organization }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @organization.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /organizations/1 or /organizations/1.json
    def destroy
      if @organization.destroy
        respond_to do |format|
          format.html { redirect_to administrator_organizations_path, status: :see_other, notice: "Organization was successfully removed." }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to admindashboard_path, alert: @organization.errors.full_messages.join(", ") }
          format.json { render json: @organization.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_organization
        @organization = Organization.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def organization_params
        params.require(:organization).permit(:email, :org_name, :street, :city, :org_state, :zipcode, :phoneNumber, :webLink, :servicesSummary)
      end
  end
end