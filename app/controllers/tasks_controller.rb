class TasksController < ApplicationController

  def index
   @tasks = Task.all
  end
    # Create CRUD's create; new action
  def new
   @task = Task.new
  end
   
    # Cteate CURD's create: create action
  def create
   @task = Task.new(task_params)
   @task.save

   redirect_to tasks_url
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)

    redirect_to tasks_path(@task)
  end


   private 

   def task_params
     params.require(:task).permit(:name, :due_date, :note)
   end

end
