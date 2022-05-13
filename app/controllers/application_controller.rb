class ApplicationController < ActionController::Base
      helper_method :current_user, :login!

      def login!(user)
            @current_user = user
            session[:session_token] = user.session_token
      end

      def logout!
            current_user.try(:reset_session_token!)
            session[:session_token] = nil
      end

      def require_logged_in
            redirect_to new_session_url if current_user.nil?
      end

      def current_user 
           return nil if session[:session_token].nil?
            @current_user ||= User.find_by(session_token: session[:session_token])
      end
end
