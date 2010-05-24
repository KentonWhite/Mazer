require 'test_helper'

class MazeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Maze.new.valid?
  end
end
