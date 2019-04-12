class ExercisesController < ApplicationController

  get '/exercises/new' do
    redirect_if_not_logged_in
    erb :"exercises/new"
  end

  # post '/exercises' do
  #   redirect_if_not_logged_in
  #   @exercise = Exercise.create(params)
  #   @exercise.workout =
  # end

end
