class ApplicationController < ActionController::API

    def index
        render json: { message: 'Server is Running' }, status: :ok
    end

end
