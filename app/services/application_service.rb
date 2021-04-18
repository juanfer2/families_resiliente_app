class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def logger
    @logger ||= Rails.logger
  end

  def url_helpers
    Rails.application.routes.url_helpers
  end
end
