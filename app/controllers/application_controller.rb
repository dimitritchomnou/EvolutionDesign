class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  before_action :authenticate_user!, if: :devise_controller?, except: [ :authenticate_admin_user! ]

  def logged_in?
    !!current_user
  end

  def access_denied(exception)
    redirect_to user_root_path, :alert => exception.message
  end

  def user_root
    redirect_to url_of_target
  end

  protected
    def after_sign_in_path_for(resource)
      clear_sign_signin_flash
      url_of_target
    end

    def clear_sign_signin_flash
      flash.delete(:notice) if flash.keys.include?('notice')
    end

    def url_of_target
      if logged_in? && current_user.administrator?
        administration_dashboard_path
      elsif logged_in? && current_user.investor?
        dashboards_path
      elsif logged_in? && current_user.entrepreneur?
        entrepreneur_dashboards_path
      else
        root_path
      end
    end

    def authenticate_admin_user!
      if logged_in?
        unless current_user.administrator?
          flash[:error]= "Accès refusé | Vous n'avez pas les droits"
          redirect_to root_path
        end
      else
        redirect_to new_user_session_path, flash: { :error =>  t("devise.failure.unauthenticated") }
      end
    end
 
end
