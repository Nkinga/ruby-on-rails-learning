class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end
   
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def create 
    @todo = Todo.create(todo_params)
    
    if @todo.save
      flash[:notice] = "Todo was successfully created"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end
  
  def index
    @todos = Todo.all
  end
  
  def show
     @todo = Todo.find(params[:id])
  end
 
  def update
    @todo = current_account.todos.find(params[:id])
    @todo.update!(todo_params)
    redirect_to @todo
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end