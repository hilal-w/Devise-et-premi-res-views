class EventsController < ApplicationController
before_action :authenticate_user!, only: [:new,:create]
  def new
    @event = Event.new
  end
  def show
    @event = Event.find(params[:id])
    @listes = @event.participants.length
  end

  def create
    @event = Event.new(start_date:params[:start_date],duration:params[:duration],title:params[:title],description:params[:description],price:params[:price],location:params[:location],admin_id:current_user.id)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render "new"
    end
  end

  def index
    @events = Event.all
  end

  


end
