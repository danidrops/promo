class ApplicationController < ActionController::Base
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
end
