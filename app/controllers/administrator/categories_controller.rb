module Administrator
  class CategoriesController < Administrator::BaseController
    before_action :set_category, only: %i[ show edit update destroy ]
    before_action :set_current_admin

    # GET /categories or /categories.json
    def index
      @categories = Category.all
    end

    # GET /categories/1 or /categories/1.json
    def show
    end

    # GET /categories/new
    def new
      @category = Category.new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories or /categories.json
    def create
      @category = Category.new(category_params)
      respond_to do |format|
        if @category.save
          format.html { redirect_to administrator_categories_path, notice: "Category was successfully created." }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /categories/1 or /categories/1.json
    def update
      respond_to do |format|
        begin
          if @category.update(category_params.except(:abbv))
            format.html { redirect_to administrator_categories_path, notice: "Category was successfully updated." }
            format.json { render :show, status: :ok, location: @category }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        rescue ActiveRecord::ReadOnlyRecord => e
          if e.message.include?("Abbreviation cannot be changed once set")
            format.html { render :edit, alert: "The abbreviation cannot be changed once set." }
            format.json { render json: { error: "The abbreviation cannot be changed once set." }, status: :unprocessable_entity }
          else
            format.html { render :edit, alert: e.message }
            format.json { render json: { error: e.message }, status: :unprocessable_entity }
          end
        end
      end
    end

    # DELETE /categories/1 or /categories/1.json
    def destroy
      if @category.destroy
        respond_to do |format|
          format.html { redirect_to administrator_categories_path, status: :see_other, notice: "Category was successfully deleted." }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to admindashboard_path, alert: @category.errors.full_messages.join(", ") }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def category_params
        params.require(:category).permit(:abbv, :cat_name)
      end
  end
end