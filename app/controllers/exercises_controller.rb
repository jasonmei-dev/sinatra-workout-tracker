class ExercisesController < ApplicationController

  get '/exercises/new' do
    redirect_if_not_logged_in
    erb :"exercises/new"
  end

  post '/exercises' do
    redirect_if_not_logged_in
    @exercise = Exercise.new(params[:exercise])
    @exercise.workout_id = session[:workout_id]

    if @exercise.save
      redirect "/workouts/#{session[:workout_id]}"
    else
      @exercise.destroy if @exercise
      redirect "/workouts/#{session[:workout_id]}"
    end
  end

  get '/exercises/:id/edit' do
    redirect_if_not_logged_in
    @exercise = Exercise.find(params[:id])
    if @exercise.workout.user == current_user
      erb :"/exercises/edit"
    else
      redirect "/workouts/#{session[:workout_id]}"
    end
  end

  patch '/exercises/:id' do
    redirect_if_not_logged_in
    @exercise = Exercise.find(params[:id])
    @exercise.update(params[:exercise]) if @exercise.workout.user == current_user
    redirect "/workouts/#{session[:workout_id]}"
  end

  delete '/exercises/:id' do
    redirect_if_not_logged_in
    @exercise = Exercise.find(params[:id])
    @exercise.destroy if @exercise.workout.user == current_user
    redirect "/workouts/#{session[:workout_id]}"
  end
end
