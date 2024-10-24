class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :require_login, only: [:new, :create]

  # GET /events or /events.json
  def index
    @events = Event.all

    #will query the Events table in the database and order by date and time
    @upcoming_events = Event.where('"eventDate" >= ?', Date.today).order('"eventDate"', '"eventTime"').limit(7)
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    puts "New action called"
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    puts "Create action called"
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.admin_id = Admin.first
    @event.eventstatus = false


    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, status: :see_other, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def require_login
      session[:user_id]
      unless logged_in?
        flash[:alert] = "You must be logged in to create an event."
        redirect_to login_path
      end
    end

    def logged_in?
      false #this is temporary as the user session logic is still being worked
      #!!session[:user_id] # This checks if the user is logged in
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :Eventdescription, :eventDate, :eventTime, :street, :city, :zipcode)
    end
end
