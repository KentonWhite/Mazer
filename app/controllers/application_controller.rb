class ApplicationController < ActionController::Base
  include Authentication
  protect_from_forgery
  layout 'application'
  
  protected
  
  def get_maze
    @maze = current_user.mazes.find params[:maze_id]    
  end
  
  def get_node
    @node = @maze.nodes.find params[:node_id]
  end
end
