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
  if !logged_in?
    flash[:notice] = "You must be logged in to perform that action"
    redirect_to root_path

  elsif !supervisor_access?
    flash[:notice] = "You must be logged in as Supervisor to perform this action"  
    redirect_to pages_workstation_home_path
  end
end

def require_associate_access
  if !logged_in?
    flash[:notice] = "You must be logged in to perform that action"
    redirect_to root_path

  elsif !associate_access?
    flash[:notice] = "You must be logged in as Supervisor to perform this action"  
    redirect_to pages_home_path
  end
end

end
