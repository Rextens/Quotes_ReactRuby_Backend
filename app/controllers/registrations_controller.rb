class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
        params.permit!

        super
            
        p params[:user]
    end
    
private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
