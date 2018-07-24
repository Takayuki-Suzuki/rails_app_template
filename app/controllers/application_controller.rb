class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from StandardError, with: :render_500
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def basic
    unless ENV['PRODUCTION_MODE']
      authenticate_or_request_with_http_basic do |user, pass|
        user == 'admin' && pass == 'admin'
      end
    end
  end

  def render_404(exception = nil)
    logger.info "Rendering 404 with exception: #{exception.message}" if exception
    render 'errors/404', status: 404
  end

  def render_500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception
    render 'errors/500', status: 500
  end
end
