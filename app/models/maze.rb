class Maze < ActiveRecord::Base
  
  belongs_to  :maze
  
  attr_accessible :title, :user_id
end
