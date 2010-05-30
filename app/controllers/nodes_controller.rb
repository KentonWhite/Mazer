class NodesController < ApplicationController 
  
  before_filter :login_required
  before_filter :get_maze

  def index
    @nodes = @maze.nodes.all
  end
  
  def show
    @node = @maze.nodes.find(params[:id])
    get_links
  end
  
  def new
    @node = @maze.nodes.new
  end
  
  def create
    @node = @maze.nodes.new(params[:node])
    if @node.save
      flash[:notice] = "Successfully created node."
      redirect_to edit_maze_path(@maze)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @node = @maze.nodes.find(params[:id])
    get_links
  end
  
  def update
    @node = @maze.nodes.find(params[:id])   
    if @node.update_attributes(params[:node])
      flash[:notice] = "Successfully updated node."
    else
      flash[:error] = "Node wasn't updated"
    end
    redirect_to edit_maze_path(@maze)
  end
  
  def destroy
    @node = @maze.nodes.find(params[:id])
    @node.destroy
    flash[:notice] = "Successfully destroyed node."
    redirect_to maze_nodes_url @maze 
  end
  
  protected
  
  
  def get_links
    @links = @node.links.all
  end  
  
end
