class FavoritesController < ApplicationController
  
  before_action :set_variables
  
  def favorite
    favorite = current_user.favorites.new(event_id: @event.id)
    favorite.save
  end

  def unfavorite
    favorite = current_user.favorites.find_by(event_id: @event.id)
    favorite.destroy
  end

  private
  def set_variables
    @event = Event.find(params[:event_id])
    @id_name = "#favorite-link-#{@event.id}"
  end

end
