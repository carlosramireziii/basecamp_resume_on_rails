require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'full name with first and last name present' do
    carlos = users(:carlos)

    assert_equal 'Carlos Ramirez', carlos.full_name
  end

  test 'full name with missing parts' do
    assert_equal 'Carlos', User.new(first_name: 'Carlos', last_name: '').full_name
    assert_equal 'Ramirez', User.new(first_name: '', last_name: 'Ramirez').full_name
    assert_equal 'Carlos', User.new(first_name: 'Carlos', last_name: ' ').full_name
  end
end
