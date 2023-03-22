class ApplicationService
  class << self
    def new
      return super() if Rails.application.config.external_application_services

      OpenStruct.new
    end
  end
end
