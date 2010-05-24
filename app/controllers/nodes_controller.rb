class NodesController < ApplicationController 
  
  before_filter :login_required
  before_filter :get_maze
  
  def index
    @nodes = @maze.nodes.all
  end
  
  def show
    @node = @maze.nodes.find(params[:id])
  end
  
  def new
    @node = @maze.nodes.new
  end
  
  def create
    @node = @maze.nodes.new(params[:node])
    if @node.save
      flash[:notice] = "Successfully created node."
      redirect_to [@maze, @node]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @node = @maze.nodes.new.find(params[:id])
  end
  
  def update
    @node = @maze.nodes.find(params[:id])
    if @node.update_attributes(params[:node])
      flash[:notice] = "Successfully updated node."
      redirect_to [@maze, @node]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @node = @maze.nodes.find(params[:id])
    @node.destroy
    flash[:notice] = "Successfully destroyed node."
    redirect_to maze_nodes_url @maze 
  end
  
end
