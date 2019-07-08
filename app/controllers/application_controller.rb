class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :current

def current_user

@current_user ||= Associate.find(session[:id]) if session[:id]

end

def logged_in?

!!current_user

end

def require_user

if !logged_in?

flash[:notice] = "You must be logged in to perform that action"

redirect_to root_path

end

end

def current
  ::Time.zone ? ::Time.zone.today : ::Date.today
end

end
