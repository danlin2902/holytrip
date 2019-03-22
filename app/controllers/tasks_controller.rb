class TasksController < ApplicationController
  def index
    set_trip
    @incomplete = Task.find_incomplete(@trip)
    @complete = Task.find_complete(@trip)
    @task = Task.new
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    set_trip
    @task = Task.new(task_params)
    @task.trip = @trip
    @task.user = current_user
    @task.save

    redirect_to trip_tasks_path(@trip)
  end

  def update
    set_task
    set_trip
    @task.update(:done_at => DateTime.now)
    redirect_to trip_tasks_path(@trip)
  end

  def destroy
    set_task
    set_trip
    @task.destroy
    redirect_to trip_tasks_path(@trip)
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :done_at, :user_id, :trip_id)
  end
end
