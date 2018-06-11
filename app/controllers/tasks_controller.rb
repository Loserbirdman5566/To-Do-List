class TasksController < ApplicationController

  before_action :set_task, :only => [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    @task.update_attributes(task_params)

    redirect_to tasks_path(@task)
  end

  def destroy
      if @task.can_destroy?
        @task.destroy
        flash[:notice] =  "Task was successfully destroyed"
        redirect_to tasks_url
      else
        flash[:notice]= "Task expired can't be deleted"
        redirect_to tasks_url
      end  

  end

   private 

   def set_task
     @task = Task.find(params[:id])
   end

   def task_params
     params.require(:task).permit(:name, :due_date, :note)
   end

end

    