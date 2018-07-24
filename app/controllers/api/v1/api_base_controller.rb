module Api
  module V1
    class ApiBaseController < ApplicationController
      include CheckCSRF
      skip_before_action :basic
      helper_method :authenticate_user!

      rescue_from StandardError, with: :render_500
      rescue_from ActionController::RoutingError, with: :render_404
      rescue_from ActiveRecord::RecordNotFound, with: :render_404

      private

      def render_404
        head :not_found
      end

      def render_500
        head :internal_server_error
      end

      def authenticate_user!
        head :unauthorized unless user_signed_in?
      end
    end
  end
end