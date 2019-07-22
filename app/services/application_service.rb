class ApplicationService
  class << self
    def new
      return super() if Rails.application.config.external_application_services

      initialize_with_mock_object
    end

    private

    def initialize_with_mock_object
      Rails.logger.info "Initialize #{self} service under #{Rails.env} environment"

      # return mock object with defined instance methods
      Object.new.tap do |object|
        instance_methods(false).each do |method|
          object.define_singleton_method(method) { |_| true }
        end
      end
    end
  end
end
