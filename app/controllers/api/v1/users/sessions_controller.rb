# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  # POST /users/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
    def session_params
      param.require(:session).permit(session_param_attributes)
    end

    def session_param_attributes
      [
        :username, :email, :password
      ]
    end
end
