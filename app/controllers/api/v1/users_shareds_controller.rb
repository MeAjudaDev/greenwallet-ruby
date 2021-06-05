module Api::V1
    class UsersSharedsController < ApplicationController
        before_action :set_user, only: [:create, :index, :destroy]

        def index
            shareds = []
            @user.shareds.each do |item|
                shareds.push({
                    id: item.id,
                    name: item.shared.name,
                    state: item.state,
                })
            end
            response = {
                id: @user.id,
                owner: @user.name,
                shareds: shareds
            }
            render json: { data: response }, status: :ok
        end

        def create
            parent = User.find_by_email(params[:email])
            if parent.present?
                user_shared = UsersShared.new
                user_shared.users_id = @user.id
                user_shared.parent_id = parent.id
                if user_shared.save
                    render json: { message: 'User shared saved successfully' }, status: :ok
                else
                    render json: { message: 'Error to save user shared' }, status: :error
                end
            end
        end

        def destroy
            if @user.shareds.find(params[:id]).destroy
                render json: { message: 'Shared delete successfully' }, status: :ok
            else
                render json: { message: 'Error to delete user shared' }, status: :error
            end
        end

        private
        def set_user
            @user = User.find(request.headers['x-session-user'])
        end
    end
end
