class ApplicationController < ActionController::Base
  #has to be after auto_session_timeout so that prepend will not be overwritten.
  protect_from_forgery with: :exception, prepend: true
end
