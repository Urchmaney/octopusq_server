class HomeController < ApplicationController
  def index
    render "welcome hone", status: :ok
  end
end