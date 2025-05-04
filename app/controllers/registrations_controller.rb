class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[ create ]

  def create
    @user = User.new(user_params)

    if @user.save
      start_new_session_for(@user)

      # send_email_verification
      redirect_to after_authentication_url
      # redirect_to root_path, notice: "Welcome! You have signed up successfully"
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.permit(:email_address, :full_name, :password, :password_confirmation)
    end

    # def send_email_verification
    #   UserMailer.with(user: @user).email_verification.deliver_later
    # end
end
