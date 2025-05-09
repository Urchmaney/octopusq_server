class UsersController < ApplicationController
  def index
    render json: Current.user, status: :ok
  end
end
