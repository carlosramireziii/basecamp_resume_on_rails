ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(user)
    post sessions_path, params: { email: user.email, password: 'mypass' }
  end

  def sign_out
    delete sessions_path
  end

  def assert_requires_registration
    yield

    assert_response :redirect
    assert_redirected_to new_users_path
    assert_not_nil flash.notice
  end

  # Allows ENV variables to be set for the duration of the block
  def with_env_vars(vars = {})
    vars_cache = ENV.slice(*vars.keys)
    vars.each { |k, v| ENV[k] = v }
    yield
    vars.each { |k, _| ENV[k] = vars_cache[k] }
  end
end
