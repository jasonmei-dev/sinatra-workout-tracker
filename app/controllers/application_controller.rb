require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end

  helpers do

    def current_user
      User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_logged_in
      if logged_in?
        flash[:message] = "You are already logged in as #{current_user.username}."
        redirect "/"
      end
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:error] = "You must be logged in to view that page!"
        redirect "/"
      end
    end

  end
end
