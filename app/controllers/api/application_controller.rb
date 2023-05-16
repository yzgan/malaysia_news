module Api
  class ApplicationController < ActionController::API
    respond_to :json

    def render_resource(resource)
      if resource.errors.empty?
          render json: resource
      else
          render_error(resource)
      end
    end

    def render_error(resource)
        render json: {
            errors: resource.errors,
        }, status: :bad_request
    end
  end
end
