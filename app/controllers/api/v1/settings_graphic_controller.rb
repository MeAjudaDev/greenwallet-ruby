module Api::V1
  class SettingsGraphicController < ApplicationController
    before_action :set_user, only: [ :create, :index, :update ]
    before_action :validate_update , only: [ :update ]

    def index
      # Retorna todas as informações das configurações
      settings = SettingsGraphic.where(owner_id: @user.id)
      render json: { data: settings }, status: :ok
    end


    def create
      # Pega o ID do Owner User para criar as configurações na tabela
      create_id = params[:id]

      # Verifica se ja tem algo criado naquele ID
      if SettingsGraphic.find_by_owner_id(create_id).present?
        render json: { message: 'Settings Graphic already exists' }, status: :bad_request
        return
      end

      # Instacias para gerar as settings no banco de dados
      new_settings_graphic_r = SettingsGraphic.new(
        owner_id: create_id,
        type_class: "R",
        private_values_mode: false,
        type_graphic: 1,
        time_course: 7
      )

      new_settings_graphic_e = SettingsGraphic.new(
        owner_id: create_id,
        type_class: "E",
        private_values_mode: false,
        type_graphic: 1,
        time_course: 7
      )

      # Verificação se salvou corretamente e retorno da API
      if new_settings_graphic_r.save and new_settings_graphic_e.save
        render json: { message: 'Settings Graphic create successfully' }, status: :ok
      else
        render json: { message: 'Error to create settings graphic' }, status: :bad_request
      end

    end

    def update

      body = JSON.parse(request.raw_post)

      if @edit_settings.update(body)
        render json: { message: 'Settings Graphic update successfully' }, status: :ok
      else
        render json: { message: 'Error to update settings graphic' }, status: :bad_request
      end

    end

    private
    def set_user
      @user = User.find(request.headers['x-session-user'])
    end

    def validate_update
      message = ""

      # TODO: Verificar validação nativa do rails
      # Valida se o type_class esta presente, por não poder atualizar o mesmo
      if params[:type_class].present?
        message = "Invalid Change 'type_class'"
      end

      id = params[:id]
      @edit_settings = SettingsGraphic.find_by_id(id)

      if @user.id != @edit_settings.owner_id
        message = "Invalid Change, current user is not settings owner"
      end

      if message != ""
        render json: { message: message },  status: :bad_request
      end

    end
  end
end
