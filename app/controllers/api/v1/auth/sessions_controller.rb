class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  private
    def resource_params
      params.require(:session).permit(:name, :email, :password)
    end
end
