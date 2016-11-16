class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user
  unless user_signed_in?
    redirect_to new_session_path, alert: 'You must sign in to do that.'
  end
end

def user_signed_in?
  session[:user_id].present?
end

helper_method :user_signed_in? # adding this line makes this mehtod accessible
                               # in view files. Because this method is in the
                               # ApplicationController then it's accessible to
                               # all views.

def current_user
  if user_signed_in?
    @current_user ||= User.find(session[:user_id])
  end
end

helper_method :current_user

end
