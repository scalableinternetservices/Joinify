class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :invite]
  # after_filter :discard_flash, only: :invite
  def discard_flash
    flash.discard if request.xhr? 
  end
  # GET /events
  # GET /events.json
  def index
    events = Event.where(:is_public => true).to_a + current_user.invited_events + current_user.accepted_events || current_user.created_events.to_a
    @events = events.sort {|a,b| b.attendees.count <=> a.attendees.count}
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @comments = @event.comments
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    if(@event.owner_id != current_user.id)
      @events = Event.all
      flash[:alert] = "You are not the owner of that event!"
      render :index
    else
      render :edit
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params.merge!(owner_id: current_user.id))
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.owner_id == current_user.id
        if @event.update(event_params)
          format.html { redirect_to @event, notice: 'Event was successfully updated.' }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    if(@event.owner_id == current_user.id)
      @event.destroy
      respond_to do |format|
        format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:alert] = "You are not the owner of that event!"
      @events = Event.all
      render :index
    end
  end

  def invite
    @user = User.find_by_username(event_params[:invitees])
    respond_to do |format|
      format.js {
        if @user
          if(@event.is_public || @event.owner_id == current_user.id)
            if(@event.invitees.map(&:id).include?(@user.id))
              flash[:notice] = "#{@user.username} is already invited to this event!"
            else
              @event.invitees << @user
              flash[:notice] = "You invited #{@user.username} to your event!"
            end
          else
            flash[:alert] = "You can't invite users to this event!"
          end
        else
          flash[:alert] = "That user does not exist!"
        end
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :latitude, :longitude, :start_date, :description, :is_public, :media_path, :invitees, :picture)
    end

    def invite_params
      params.permit(:invite_username)
    end
end
