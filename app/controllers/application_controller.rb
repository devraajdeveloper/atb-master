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

def supervisor_access?
  if session[:access] == "Supervisor"
    return true
  else
    return false
  end
end

def associate_access?
  if session[:access] == "Associate"
    return true
  else
    return false
  end
end

def require_supervisor_access

  if !supervisor_access?
    

end

end
