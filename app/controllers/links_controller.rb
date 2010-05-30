class LinksController < ApplicationController

  before_filter :login_required
  before_filter :get_maze
  before_filter :get_node
  
  def new
    @link = @node.links.new
    @nodes = @maze.nodes.all.collect { |n| [n.title, n.id] }
  end
  
  def create
    @link = @node.links.new(params[:link])
    if @link.save
      flash[:notice] = "Successfully created link."
      redirect_to edit_maze_node_path(@maze, @node)
    else 
      flash[:error] = "Link wasn't created"
      redirect_to new_maze_node_link_path(@maze, @node)
    end
  end
  
  def edit
    @link = @node.links.find(params[:id])
    @nodes = @maze.nodes.all.collect { |n| [n.title, n.id] }
  end
  
  def update
    @link = @node.links.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = "Successfully updated link."
    redirect_to edit_maze_node_path(@maze, @node)
    else
      flash[:error] = "Link wasn't updated"
      redirect_to edit_maze_node_link_path(@maze, @node)
    end
  end
  
  def destroy
    @link = @node.links.find(params[:id])
    @link.destroy
    flash[:notice] = "Successfully destroyed link."
    redirect_to maze_node_path @maze, @node
  end
end
