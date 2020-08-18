require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'validates title' do
    project = Project.new(title: nil)
    refute project.valid?
    assert_includes project.errors[:title], "can't be blank"
  end

  test 'validates description' do
    project = Project.new(description: nil)
    refute project.valid?
    assert_includes project.errors[:title], "can't be blank"
  end
end
