require 'test_helper'

class NodesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Node.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Node.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Node.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to node_url(assigns(:node))
  end
  
  def test_edit
    get :edit, :id => Node.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Node.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Node.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Node.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Node.first
    assert_redirected_to node_url(assigns(:node))
  end
  
  def test_destroy
    node = Node.first
    delete :destroy, :id => node
    assert_redirected_to nodes_url
    assert !Node.exists?(node.id)
  end
end
