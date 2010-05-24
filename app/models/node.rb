class Node < ActiveRecord::Base 
  
  belongs_to  :node
  
  attr_accessible :title, :content, :maze_id
end
