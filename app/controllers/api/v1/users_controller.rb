module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!

      def sign_in
        render json: { message: 'success' }
      end

      def register
      end

      def test
        render json: { message: 'success' }
      end
    end
  end
end
