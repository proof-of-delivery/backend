class AuthenticationController < ApplicationController

    include JsonWebToken

    before_action :authenticate_request






    # POST /auth/login
    def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = JwtToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, exp: time.strftime ("m-%d-%Y %H: °M"),
                          username: @user.user_name }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end
    end

    private
    def authenticate_request

        header = request.headers['Authorization']
        header = header.split(' ').last if header
        decoded = jwt_decode(header)
        @current_user = User.find(decoded[:user_id])
end
