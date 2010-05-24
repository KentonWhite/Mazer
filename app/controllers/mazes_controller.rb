class MazesController < ApplicationController
  
  before_filter :login_required
  
  def index 
    @mazes = Maze.all
  end
  
  def show
    @maze = Maze.find(params[:id])
  end
  
  def new
    @maze = Maze.new
  end
  
  def create
    @maze = Maze.new(params[:maze])
    if @maze.save
      flash[:notice] = "Successfully created maze."
      redirect_to @maze
    else
      render :action => 'new'
    end
  end
  
  def edit
    @maze = Maze.find(params[:id])
  end
  
  def update
    @maze = Maze.find(params[:id])
    if @maze.update_attributes(params[:maze])
      flash[:notice] = "Successfully updated maze."
      redirect_to @maze
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @maze = Maze.find(params[:id])
    @maze.destroy
    flash[:notice] = "Successfully destroyed maze."
    redirect_to mazes_url
  end
end
