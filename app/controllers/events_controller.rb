class EventsController < ApplicationController

  layout 'basic', only: :new

  def index
  end

  def new
    @event = Event.new
    @event.build_address
  end

  def create
    @address = Address.new(event_params[:address_attributes])
    @address.geocode
    unless @address[:latitude] == nil
    # binding.pry
    # #   if @address.valid?
      new_params = event_params
      new_params[:address_attributes].merge!(latitude: @address.latitude, longitude: @address.longitude)
      @event = Event.new(new_params)
      @event.save
    # #   else
    # #     # 緯度でバリデーションかけて「北海道ではありません」とエラーメッセージ を返す
    # #   end
      redirect_to root_path
    else
      redirect_to new_event_path, alert: '位置情報を取得できませんでした'
       # 「位置情報を取得できませんでした」とエラーメッセージを返す
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def event_params
    params.require(:event).permit(:name, :url, :start, :end, :category_id, address_attributes: [:postcode, :place, :place_building]).merge(user_id: current_user.id)
  end
  # private
  # def event_params(address_hash={})
  #   params.require(:event).permit(:name, :url, :start, :end, :category_id, address_attributes: [:postcode, :place, :place_building]).merge(user_id: current_user.id, **address_hash)
  # end

end
