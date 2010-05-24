class Link < ActiveRecord::Base 
  
  belongs_to  :node
  
  attr_accessible :text, :node_id, :to_node_id
end
