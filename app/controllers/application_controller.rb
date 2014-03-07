class ApplicationController < ActionController::Base
  before_filter :https_redirect
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from Exception, :with => :server_error

  def server_error(exception)
  # Whatever code that handles the exception

    ExceptionNotifier.notify_exception(exception,
      :env => request.env)
    # ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver
  end

  private

    def https_redirect
      if Rails.env.production?
        if !request.ssl?
          flash.keep
          redirect_to protocol: "https://", status: :moved_permanently
        end
      end
    end
end