class UsersController < ApplicationController 
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_current_user, only: [:show, :edit, :update, :destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/:id or /users/:id.json
  def show
    # @user is set in the before_action
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def dashboard
    @users = User.all
  end

  # GET /users/:id/edit
  def edit
    # @user is set in the before_action
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        # Log validation errors for debugging
        logger.debug "User creation failed: #{@user.errors.full_messages.join(', ')}"

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/:id or /users/:id.json
  def update
    respond_to do |format|
      if @user.update(user_params.except(:username))
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:id or /users/:id.json
  def destroy
    if session[:username] == @user.username
      session[:username] = nil
    end
    if @user.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_path, status: :see_other, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to dashboard_path, alert: @user.errors.full_messages.join(", ") }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id]) # Changed to find by ID
    if @user.nil?
      redirect_to users_path, alert: "User not found."
    end
  end

  def set_current_user
    @current_user = User.find_by(username: session[:username]) if session[:username] # Keep as is
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :first_name, :email, :age_range, :password, :password_confirmation, :zipcode)
  end
end
