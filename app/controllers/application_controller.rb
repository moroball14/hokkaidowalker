class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user
  before_action :set_search

  # このアクションを追加
  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :avatar])
  end

  def set_user
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def set_search
    @search = Event.ransack(params[:q])
  end

end
