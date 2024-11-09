module Administrator
  class UsersController < Administrator::BaseController
    before_action :set_user, only: %i[show edit update destroy]
    before_action :set_current_user, only: %i[show edit update destroy]

    # GET /users or /users.json
    def index
      # Render the login form here
      @user = User.new  # Initialize a new user for the login form
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # POST /users - Profile creation
    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          session[:user_username] = @user.username
          format.html { redirect_to root_path, notice: "Profile successfully created!" }
        else
          flash.now[:alert] = @user.errors.full_messages.join(", ")
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    # POST /userlogin - Login action
    def login
      @user = User.find_by(username: params[:username])

      if @user&.authenticate(params[:password])
        session[:user_username] = @user.username
        redirect_to root_path, notice: "Welcome back!"
      else
        flash.now[:alert] = "Invalid username or password"
        render :index, status: :unprocessable_entity  # Render the login form again
      end
    end

    # PATCH/PUT /users/:username - Profile update
    def update
      respond_to do |format|
        if @user.update(user_params.except(:username))
          format.html { redirect_to user_path(username: @user.username), notice: "Profile successfully updated." }
        else
          flash.now[:alert] = @user.errors.full_messages.join(", ")
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /userlogout - Logout action
    def destroy
      session[:user_username] = nil
      redirect_to login_path, notice: "Successfully logged out."
    end

    private

    # Set the user based on username
    def set_user
      @user = User.find_by(username: params[:username])
      redirect_to users_path, alert: "User not found." if @user.nil?
    end

    # Set the current logged-in user
    def set_current_user
      @current_user = User.find_by(username: session[:user_username]) if session[:user_username]
    end

    # Permit trusted parameters
    def user_params
      params.require(:user).permit(:username, :first_name, :email, :age_range, :password, :password_confirmation, :zipcode)
    end
  end
end