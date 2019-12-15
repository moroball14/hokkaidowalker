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
    event_params[:address_attributes].merge!(latitude: @address.latitude, longitude: @address.longitude)
    @event = Event.new(event_params)
    binding.pry
    # if @address.geocode
    #   if @address.valid?
    #     @event.save
    #   else
    #     # 緯度でバリデーションかけて「北海道ではありません」とエラーメッセージ を返す
    #   end
    # else
    #   # 「位置情報を取得できませんでした」とエラーメッセージを返す
    # end
    @event.save
    redirect_to root_path
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

end
