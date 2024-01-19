class ApplicationController < ActionController::Base
  def current_user
    @curr_user = User.first
  end
end
