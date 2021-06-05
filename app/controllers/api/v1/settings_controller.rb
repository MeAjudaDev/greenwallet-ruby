module Api::V1
    class SettingsController < ApplicationController
        def index
            render json: { message: 'Get Settings Index' }, status: :ok
        end

        def indentify
            p params[:id]
            render json: { message: 'Get Settings Indentify', id: params[:id] }, status: :ok
        end

        def post
            p 'Resultado enviado'
            p request.body.read
            render json: request.body.read, status: :ok
        end
        
    end
end
