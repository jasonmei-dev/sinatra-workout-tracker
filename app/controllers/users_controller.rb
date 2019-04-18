class UsersController < ApplicationController

  get '/signup' do
    redirect_if_logged_in
    erb :'users/new'
  end

  post '/signup' do
    @user = User.new(params)

    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "You successfully created an account!"
      redirect "/"
    else
      flash[:error] = "Account creation failed. Please try again!"
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
      flash[:message] = "You have successfully logged in!"
      redirect "/"
    else
      flash[:error] = "Your credentials were invalid. Please try again or sign up!"
      redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      flash[:message] = "You have been logged out!"
      redirect "/"
    else
      redirect "/"
    end
  end

  get '/users' do
    redirect_if_not_logged_in
    @users = User.all
    erb :"users/index"
  end

  get '/users/:slug' do
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    erb :"users/show"
  end
end
