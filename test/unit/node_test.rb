require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Node.new.valid?
  end
end
