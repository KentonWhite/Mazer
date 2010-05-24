class NodesController < ApplicationController 
  
  before_filter :login_required
  before_filter :get_maze
  
  def index
    @nodes = Node.all
  end
  
  def show
    @node = Node.find(params[:id])
  end
  
  def new
    @node = Node.new
  end
  
  def create
    @node = Node.new(params[:node])
    if @node.save
      flash[:notice] = "Successfully created node."
      redirect_to [@maze, @node]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @node = Node.find(params[:id])
  end
  
  def update
    @node = Node.find(params[:id])
    if @node.update_attributes(params[:node])
      flash[:notice] = "Successfully updated node."
      redirect_to [@maze, @node]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @node = Node.find(params[:id])
    @node.destroy
    flash[:notice] = "Successfully destroyed node."
    redirect_to maze_nodes_url @maze 
  end
  
  protected
  
  def get_maze
    @maze = current_user.mazes.find params[:maze_id]    
  end
end
