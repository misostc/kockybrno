class UsersController < ApplicationController
  def show
  end

  def index
    @users = User.all.order(:last_name)
  end
end
