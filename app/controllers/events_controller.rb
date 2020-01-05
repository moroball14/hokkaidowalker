class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_event, only: [:edit, :update, :destroy, :show]

  layout 'basic', only: :index

  def index
    @past_events = Event.where('end_on < ?', Date.today)
    if @past_events.present?
      @past_events.destroy_all
    end
    @events =
    if params[:q].present?
      @search.result.includes(:address)
    else
      Event.includes(:address).all
    end
  end

  def new
    @event = Event.new
    @event.build_address
  end

  def create
    @address = Address.new(event_params[:address_attributes])
    @address.geocode
    unless @address[:latitude] == nil
      if (@address[:latitude] > 41.3291265 && (@address[:longitude] < 140.6749102 || @address[:longitude] > 141.5812776)) || (@address[:latitude] > 41.6583837 && (@address[:longitude] > 140.6749102 && @address[:longitude] < 141.5812776))
          new_params = event_params
          new_params[:address_attributes].merge!(latitude: @address.latitude, longitude: @address.longitude)
          @event = Event.new(new_params)
          if @event.valid?
            @event.save
            redirect_to root_path, notice: 'イベントを登録しました'
          else
            render 'new'
          end
      else
        redirect_to new_event_path, alert: '北海道ではありません'# 緯度でバリデーションかけて「北海道ではありません」とエラーメッセージ を返す
      end
    else
      redirect_to new_event_path, alert: '位置情報を取得できませんでした'
    end
  end

  def edit
    @event.address = Address.new if @event.address.blank?
  end

  def update
    @address = Address.new(event_params[:address_attributes])
    @address.geocode
    unless @address[:latitude] == nil
      if (@address[:latitude] > 41.3291265 && (@address[:longitude] < 140.6749102 || @address[:longitude] > 141.5812776)) || (@address[:latitude] > 41.6583837 && (@address[:longitude] > 140.6749102 && @address[:longitude] < 141.5812776))
        new_update_params = update_event_params
        new_update_params[:address_attributes].merge!(latitude: @address.latitude, longitude: @address.longitude)
        if @event.valid? && @event.update(new_update_params)
          redirect_to event_path(@event)
        else
          redirect_to edit_event_path(@event), alert: '上書きできませんでした'
        end
      else
        redirect_to edit_event_path(@event), alert: '北海道ではありません'# 緯度でバリデーションかけて「北海道ではありません」とエラーメッセージ を返す
      end
    else
      redirect_to edit_event_path(@event), alert: '位置情報を取得できませんでした'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, notice: 'イベントを削除しました'
  end

  def show
  end

  def ranking
    @all_ranks = Event.includes(:address).find(Favorite.group(:event_id).order('count(event_id) desc').limit(10).pluck(:event_id))
  end

  private
  def event_params
    params.require(:event).permit(:name, :url, :start, :end_on, :category_id, address_attributes: [:postcode, :place, :place_building]).merge(user_id: current_user.id)
  end

  def update_event_params
    params.require(:event).permit(:name, :url, :start, :end_on, :category_id, address_attributes: [:postcode, :place, :place_building, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
