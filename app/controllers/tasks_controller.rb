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

   private 

   def task_params
     params.require(:task).permit(:name, :due_date, :note)
   end

end
