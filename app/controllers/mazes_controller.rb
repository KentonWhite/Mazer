class MazesController < ApplicationController
  
  before_filter :login_required
  
  def index 
    @mazes = current_user.mazes.all
  end
  
  def show
    @maze = current_user.mazes.find(params[:id])
  end
  
  def new
    @maze = current_user.mazes.new
  end
  
  def create
    @maze = current_user.mazes.new(params[:maze])
    if @maze.save
      flash[:notice] = "Successfully created maze."
      redirect_to @maze
    else
      render :action => 'new'
    end
  end
  
  def edit
    @maze = current_user.mazes.find(params[:id])
  end
  
  def update
    @maze = current_user.mazes.find(params[:id])
    if @maze.update_attributes(params[:maze])
      flash[:notice] = "Successfully updated maze."
      redirect_to @maze
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @maze = current_user.mazes.find(params[:id])
    @maze.destroy
    flash[:notice] = "Successfully destroyed maze."
    redirect_to mazes_url
  end
end
