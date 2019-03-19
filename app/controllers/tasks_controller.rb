class TasksController < ApplicationController
  before_action :set_task
  before_action :set_trip

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = task.new(task_params)
    @task.trip = @trip
    @task.user = current_user
    @task.save
    # "insert Error Handling Notice" if fail to save
  end

  def update
    @task.update ? @task.save : "insert Error Handling Notice"
  end

  def destroy
    @task.destroy
    # insert alert for succesful delete
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_task
    params.require(:task).permit(:name, :description, :due_date, :done_at, :user_id, :trip_id)
    @task = Task.find(params[:id])
  end
end
