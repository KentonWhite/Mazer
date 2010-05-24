class Node < ActiveRecord::Base 
  
  belongs_to  :maze
  has_many    :links
  
  attr_accessible :title, :content, :maze_id
end
