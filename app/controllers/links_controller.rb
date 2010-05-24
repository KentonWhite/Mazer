class LinksController < ApplicationController

  before_filter :login_required
  before_filter :get_maze
  before_filter :get_node
  
  def new
    @link = @node.links.new
  end
  
  def create
    @link = @node.links.new(params[:link])
    if @link.save
      flash[:notice] = "Successfully created link."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @link = @node.links.find(params[:id])
  end
  
  def update
    @link = @node.links.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = "Successfully updated link."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @link = @node.links.find(params[:id])
    @link.destroy
    flash[:notice] = "Successfully destroyed link."
    redirect_to maze_node_path @maze, @node
  end
end
