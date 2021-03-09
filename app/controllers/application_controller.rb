class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #コントローラーの先頭に記載することで、そこで行われる処理はログインユーザーによってのみ実行可能#
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

