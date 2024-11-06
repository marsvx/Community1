module Administrator
  class ClassificationsController < Administrator::BaseController
    before_action :set_classification, only: %i[ show edit update destroy ]
    before_action :set_current_admin
    
    # GET /classifications or /classifications.json
    def index
      @classifications = Classification.all
    end

    # GET /classifications/1 or /classifications/1.json
    def show
    end

    # GET /classifications/new
    def new
      @classification = Classification.new
    end

    # GET /classifications/1/edit
    def edit
    end

    # POST /classifications or /classifications.json
    def create
      @classification = Classification.new(classification_params)

      respond_to do |format|
        if @classification.save
          format.html { redirect_to administrator_classifications_path, notice: "Classification was successfully created." }
          format.json { render :show, status: :created, location: @classification }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @classification.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /classifications/1 or /classifications/1.json
    def update
      respond_to do |format|
        if @classification.update(classification_params)
          format.html { redirect_to administrator_classifications_path, notice: "Classification was successfully updated." }
          format.json { render :show, status: :ok, location: @classification }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @classification.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /classifications/1 or /classifications/1.json
    def destroy
      if @classification.destroy
        respond_to do |format|
          format.html { redirect_to administrator_classifications_path, status: :see_other, notice: "Classification was successfully destroyed." }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to admindashboard_path, alert: @classification.errors.full_messages.join(", ") }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_classification
        @classification = Classification.find(params[:associationID])
      end

      # Only allow a list of trusted parameters through.
      def classification_params
        params.require(:classification).permit(:organizationID_id, :categoryabbr_id)
      end
  end
end