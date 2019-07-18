class ApplicationService
  class << self
    def new(*argument, &block)
      return super() if Rails.application.config.external_application_services
      initialize_with_mock_object
    end

    private

    def initialize_with_mock_object
      Rails.logger.info "Initialize #{self} service under #{Rails.env} environment"

      # return mock object with defined instance methods
      test = Object.new.tap do |object|
        instance_methods(false).each do |method|
          object.define_singleton_method(method) { |*arg| true }
        end
      end
    end
  end
end
