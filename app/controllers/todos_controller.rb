class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :show, :update, :destroy]
  
  
  def new
    @todo = Todo.new
  end
   
  def edit
    
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
  
  def destroy
      @todo.destroy
      flash[:notice] = "Todo was successfully deleted." 
      redirect_to todos_path
  end
    
  def show
     
  end
 
  def update
    if @todo.update!(todo_params)
      flash[:notice] = "Todo was successfully updated"
      redirect_to @todo
    else
      render 'edit'
    end
  end
  
  private

  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end