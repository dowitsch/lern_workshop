class LoginsController < ApplicationController
skip_before_filter :is_user_logged_in

     def destroy
       session[:user_id] = nil
       redirect_to root_url, :notice => "Logged out!"
     end

     
    def login
      #Login Form
    end

    def login_attempt
      authorized_user = User.authenticate(params[:username_or_email],params[:login_password])

      if authorized_user
        session[:user_id] = authorized_user.id
        flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.vorname}"
        redirect_to posts_url

      else
        flash[:notice] = "Invalid Username or Password"
        flash[:color]= "invalid"
        render "index"	
      end
    end
end
