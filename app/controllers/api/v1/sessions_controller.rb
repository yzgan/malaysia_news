# frozen_string_literal: true

module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json
      skip_forgery_protection
      before_action :configure_permitted_parameters

      protected

      def auth_options
        super.merge({ store: false })
      end
  
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in)
      end

      private

      def respond_with(resource, _opts = {})
        render json: { message: 'Logged.' }, status: :ok
      end
      def respond_to_on_destroy
        current_user ? log_out_success : log_out_failure
      end
      def log_out_success
        render json: { message: "Logged out." }, status: :ok
      end
      def log_out_failure
        render json: { message: "Logged out failure."}, status: :unauthorized
      end
    end
  end
end
