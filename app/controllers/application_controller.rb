require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  helpers do

    def current_user
      @user ||= User.find_by(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_logged_in
      redirect "/" if logged_in?
    end

    def redirect_if_not_logged_in
      redirect "/" if !logged_in?
    end

  end
end
