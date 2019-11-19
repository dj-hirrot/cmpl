class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  def create
    # TODO: [dj-hirrot] emailかusernameか判断してkey名を切り替える
    if params[:session][:login].include?('@')
      params[:session][:email] = params[:session].delete(:login)
    else
      params[:session][:username] = params[:session].delete(:login)
    end

    super
  end

  private
    def resource_params
      params.require(:session).permit(:login, :password)
    end
end
