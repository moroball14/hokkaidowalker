class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
    @event.addresses.build
  end

  def create
  end

  def update
  end
end
