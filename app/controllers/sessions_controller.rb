class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      render json: "Logged In", status: :ok
    else
      render json: { error: "Email or password is incorrect." }, status: :unauthorized
    end
  end

  def destroy
    terminate_session
    render json: { msg: "logged out" }, status: :no_content
  end
end
