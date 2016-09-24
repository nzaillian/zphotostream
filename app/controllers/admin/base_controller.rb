class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :require_login

  def require_login
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
   
      redirect_to new_user_session_path(next: request.path) and return
    end    
  end
end