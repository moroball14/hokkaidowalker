class EventsController < ApplicationController

  layout 'basic', only: :new

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.save
  end

  def update
  end

  private
  def event_params
    params.require(:event).permit(:name, :url, :start, :end, :category_id, address_attributes: [:postcode, :place, :place_building])
  end

end
