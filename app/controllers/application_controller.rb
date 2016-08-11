class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_filter :is_user_logged_in 
  protect_from_forgery
      
      def is_user_logged_in
        redirect_to logins_url if session[:user_id].nil?
      end

      private

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

      helper_method :current_user
end
