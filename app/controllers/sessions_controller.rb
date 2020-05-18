class SessionsController < ApplicationController
 
 skip_before_filter :can_proceed
 
  class DoubleLoginError < ArgumentError; end
  class NotCurrentUserError < ArgumentError; end

  def new
  end
  
  # def nested_hash nh
  #   puts "VALUE is a nested hash"
  #   p nh
  #   nh.each_pair do |key,value|
  #     puts "KEY: #{key}"
  #     if value.kind_of?(Hash)
  #       nested_hash(value)
  #     else
  #       puts "VALUE: #{value}"
  #     end
  #   end
  # end


  def create
  
    begin
  
      if session?
        if same_as_logged_in_user? auth_hash['info']
          raise DoubleLoginError, 
          "You may not login if you are already logged in"
        else
          raise NotCurrentUserError,
          "Identity Violation - Access Denied!"
        end
      else
        if Authorization.exists?(auth_hash)
          auth = Authorization.find_with_omniauth(auth_hash)
          message = "Welcome back #{auth.user.name}! "+
                  "You have logged in via #{auth.provider}"
        else
          if User.exists?(auth_hash['info'])
            user = User.create_with_omniauth(auth_hash['info'])
            auth = user.add_provider(auth_hash)
            message = "You can now login using #{auth_hash["provider"].captitalize}"
          else
            user = User.create_with_omniauth(auth_hash["info"])
            auth = user.authorizations.create_with_omniauth(auth_hash)
            message = "Welcome #{user.name}! You've signed up via #{auth.provider}."
          end
        end
        session[:user_id] = auth.user.id
        self.current_user = auth.user
        flash[:notice] = "#{message}"
        redirect_to dashboard_index_path and return
      end
  # render :text => auth_hash.inspect
    rescue DoubleLoginError,NotCurrentUserError, Exception=> exception
      flash[:error] = "#{exception.class}: #{exception.message}"
      redirect_to dashboard_index_path and return
    end
  end
  
  def failure
    begin
    rescue Exception => exception
    flash[:error] = "#{exception.class}: #{exception.message}"
    redirect_to welcome_login_path
    end
  end
  
  def destroy
    message = "#{self.current_user.name} has logged out"
    self.current_user = nil
    session.delete(:user_id)
    reset_session
    flash[:notice] = message
    redirect_to welcome_login_path
  
  end

  def cleanup
    reset_session
    flash[:warning] = "Session Reset"
    redirect_to welcome_login_path
  end

  def auth_hash
    @auth_hash ||=request.env['omniauth.auth']
  end
  
  def session?
    !!session[:user_id]
  end
  
  def same_as_logged_in_user? info
    user = User.find(session[:user_id])
    user.name == info['name'] && user.email == info['email']
  end
 

end