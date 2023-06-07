module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_api_v1_user!

      def sign_in
        render json: { message: 'success' }
      end

      def register
      end

      def test
        render json: current_user
      end
    end
  end
end
