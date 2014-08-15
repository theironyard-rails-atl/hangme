class UsersController < ApplicationController
  def select
    @users = User.all
  end

  def change
    # "Permanently" stores the selected user in the
    #   session
    # For this user, for this browsing session
    session[:selected_user] = params[:selected_user]
    redirect_to games_path
  end
end
