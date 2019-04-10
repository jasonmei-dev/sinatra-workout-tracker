class UsersController < ApplicationController

  get '/signup' do
    redirect_if_logged_in
    erb :'users/new'
  end

  post '/signup' do
    @user = User.new(params)

    if @user.save
      session[:user_id] = @user.id
      redirect "/"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    redirect_if_logged_in
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/"
    else
      redirect "/"
    end
  end

  get '/logout' do
    session.clear if logged_in?
    redirect "/"
  end

end
