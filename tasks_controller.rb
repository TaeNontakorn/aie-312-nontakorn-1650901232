class TasksController < ApplicationController
end
class TasksController < ApplicationController
    def index
      @tasks = Task.where(status: false) # Only incomplete tasks
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      @task.status = false # Incomplete by default
      if @task.save
        redirect_to tasks_path, notice: "Task created successfully."
      else
        render :index, alert: "Task creation failed."
      end
    end
  
    def complete
      @task = Task.find(params[:id])
      @task.update(status: true) # Mark as complete
      redirect_to tasks_path, notice: "Task marked as complete."
    end
  
    private
  
    def task_params
      params.require(:task).permit(:name)
    end
  end
  