require 'test_helper'

class MazesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Maze.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Maze.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Maze.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to maze_url(assigns(:maze))
  end
  
  def test_edit
    get :edit, :id => Maze.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Maze.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Maze.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Maze.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Maze.first
    assert_redirected_to maze_url(assigns(:maze))
  end
  
  def test_destroy
    maze = Maze.first
    delete :destroy, :id => maze
    assert_redirected_to mazes_url
    assert !Maze.exists?(maze.id)
  end
end