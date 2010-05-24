class Maze < ActiveRecord::Base
  
  belongs_to  :maze 
  has_many    :nodes
  
  attr_accessible :title, :user_id
end
