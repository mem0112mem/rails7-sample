class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.all
  end
    
  def new
    @todo = Todo.new
  end

  def create
    # p "craete===="
    @todo = Todo.new(todo_params)
    # p "todo_params===="
    # p todo_params

    if @todo.save
      redirect_to todos_path, notice: 'タスクが作成されました。'
    else
      render :new
    end
    
  end

  def edit
  end

  def show
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: 'タスクが更新されました。'
    else
      render :edit
    end
    
  end
    
  def destroy
    if @todo
      @todo.destroy
      redirect_to todos_path, notice: 'タスクが削除されました。'
    else
      redirect_to todos_path, alert: 'タスクが見つかりませんでした。'
    end
  end
    
  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :is_done)
    end

end
