class Users::OmniauthController < ApplicationController
    def facebook
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
          sign_in @user
          redirect_to home_index_path
        #   set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
        else
          flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
          redirect_to new_user_registration_url
        end 
      end

      def failure
        flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
        redirect_to new_user_registration_url
      end
end
