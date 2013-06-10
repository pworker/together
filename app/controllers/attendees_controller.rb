class AttendeesController < ApplicationController
  before_action :set_event
  before_action :set_attendee, only:[:edit, :update]
  def index
    @attendees = @event.attendees
  end

  def new
    @attendee = Attendee.new
  end

  def create
    if @event.attendees.create(attendee_params)
      redirect_to :action => "index"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to :action => "index"
    else
      render action 'edit'
    end
  end

  def destroy
    @event.attendees.destroy(params[:id])
    redirect_to :action => "index" 
  end

  private
  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_attendee
    @attendee = @event.attendees.find(params[:id])
  end

  def attendee_params
    params.require(:attendee).permit(:name, :email, :phone, :comment)
  end

end
