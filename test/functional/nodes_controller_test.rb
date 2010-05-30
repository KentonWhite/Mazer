require 'test_helper'

class NodesControllerTest < ActionController::TestCase
  def setup
    login_as users(:foo)
  end
  
  
  def test_index
    get :index, :maze_id => mazes(:one)
    assert_template 'index'
  end
  
  def test_show
    get :show, :maze_id => mazes(:one), :id => Node.first
    assert_template 'show'
  end
  
  def test_new
    get :new, :maze_id => mazes(:one)
    assert_template 'new'
  end
  
  def test_create_invalid
    Node.any_instance.stubs(:valid?).returns(false)
    post :create, :maze_id => mazes(:one)
    assert_template 'new'
  end
  
  def test_create_valid
    Node.any_instance.stubs(:valid?).returns(true)
    post :create, :maze_id => mazes(:one)
    assert_redirected_to maze_node_url(mazes(:one), assigns(:node))
  end
  
  def test_edit
    get :edit, :maze_id => mazes(:one), :id => Node.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Node.any_instance.stubs(:valid?).returns(false)
    put :update, :maze_id => mazes(:one), :id => Node.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Node.any_instance.stubs(:valid?).returns(true)
    put :update, :maze_id => mazes(:one), :id => Node.first
    assert_redirected_to maze_node_url(mazes(:one), assigns(:node))
  end
  
  def test_destroy
    node = Node.first
    delete :destroy, :maze_id => mazes(:one), :id => node
    assert_redirected_to maze_nodes_url(mazes(:one))
    assert !Node.exists?(node.id)
  end
end
