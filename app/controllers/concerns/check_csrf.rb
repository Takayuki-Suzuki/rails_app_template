module CheckCSRF
  extend ActiveSupport::Concern

  included do
    after_action :set_csrf_token_to_cookie
  end

  private

  def set_csrf_token_to_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end