# frozen_string_literal: true

class AuthenticationController < ApplicationController

  def login
    @user = User.find_by(email: login_params[:email])
    if @user&.authenticate(login_params[:password])
      token = TokenAuthService.issue(user_id: @user.id, username: @user.name, email: @user.email,
                                     role: @user.roles_name)
      render json: { token:, username: @user.name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:payload).permit(:email, :password)
  end
end
