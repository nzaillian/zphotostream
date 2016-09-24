class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  protect_from_forgery with: :exception

  helper_method :render_to_string

  def self.member_actions(*extras)
    [:show, :edit, :update, :destroy] + extras
  end

  def self.collection_actions(*extras)
    [:index, :new, :create] + extras
  end  
end
