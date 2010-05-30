require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  def setup
    login_as users(:foo)
  end
  
  
  def test_new
    get :new, :maze_id => mazes(:one), :node_id => nodes(:one)
    assert_template 'new'
  end
  
  def test_create_invalid
    Link.any_instance.stubs(:valid?).returns(false)
    post :create, :maze_id => mazes(:one), :node_id => nodes(:one)
    assert_template 'new'
  end
  
  def test_create_valid
    Link.any_instance.stubs(:valid?).returns(true)
    post :create, :maze_id => mazes(:one), :node_id => nodes(:one)
    assert_redirected_to root_url
  end
  
  def test_edit
    get :edit, :maze_id => mazes(:one), :node_id => nodes(:one), :id => Link.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Link.any_instance.stubs(:valid?).returns(false)
    put :update, :maze_id => mazes(:one), :node_id => nodes(:one), :id => Link.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Link.any_instance.stubs(:valid?).returns(true)
    put :update, :maze_id => mazes(:one), :node_id => nodes(:one), :id => Link.first
    assert_redirected_to root_url
  end
  
  def test_destroy
    link = Link.first
    delete :destroy, :maze_id => mazes(:one), :node_id => nodes(:one), :id => link
    assert_redirected_to maze_node_path mazes(:one), nodes(:one)
    assert !Link.exists?(link.id)
  end
end
