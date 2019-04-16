class WorkoutsController < ApplicationController

  get '/workouts/new' do
    redirect_if_not_logged_in
    erb :"workouts/new"
  end

  post '/workouts' do
    redirect_if_not_logged_in
    @workout = current_user.workouts.new(params[:workout])
    if @workout.save
      flash[:message] = "Workout created!"
      redirect "/workouts/#{@workout.id}"
    else
      flash[:error] = "Workout creation failed! Please make sure all required fields are filled."
      redirect "/workouts/new"
    end
  end

  get '/workouts/:id' do
    redirect_if_not_logged_in
    session[:workout_id] = params[:id]
    @workout = Workout.find(session[:workout_id])
    erb :"workouts/show"
  end

  get '/workouts/:id/edit' do
    redirect_if_not_logged_in
    @workout = Workout.find(params[:id])
    if @workout.user == current_user
      erb :"workouts/edit"
    else
      flash[:error] = "You can't edit another user's workout!"
      redirect "/workouts/#{@workout.id}"
    end
  end

  patch '/workouts/:id' do
    redirect_if_not_logged_in
    @workout = Workout.find(params[:id])
    @workout.update(params[:workout]) if @workout.user == current_user
    redirect "/workouts/#{@workout.id}"
  end

  delete "/workouts/:id" do
    redirect_if_not_logged_in
    @workout = Workout.find(params[:id])
    if @workout.user == current_user
      @workout.destroy
      flash[:message] = "Workout deleted!"
      redirect "/users/#{@workout.user.slug}"
    else
      flash[:error] = "You can't delete another user's workout!"
      redirect "/workouts/#{@workout.id}"
    end
  end

end
