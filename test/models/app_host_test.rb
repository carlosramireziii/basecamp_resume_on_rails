require 'test_helper'

class AppHostTest < ActiveSupport::TestCase
  test 'should return app domain' do
    with_env_vars 'DOMAIN' => 'example.org' do
      assert_equal 'example.org', AppHost.domain
    end
  end

  test 'should return app web port' do
    with_env_vars 'WEB_PORT' => '3000' do
      assert_equal '3000', AppHost.port
    end
  end

  test 'should return app domain and web port' do
    with_env_vars 'DOMAIN' => 'example.org', 'WEB_PORT' => '3000' do
      assert_equal 'example.org:3000', AppHost.domain_with_port
    end
  end

  test 'should return https protocol if the app is using SSL' do
    with_env_vars 'USE_SSL' => 'true' do
      assert_equal 'https', AppHost.protocol
    end
  end

  test 'should indicate if the app should use SSL' do
    with_env_vars 'USE_SSL' => 'true' do
      assert AppHost.use_ssl?
    end
  end

  test 'should use default values if environment vars not set' do
    with_env_vars 'DOMAIN' => nil, 'WEB_PORT' => nil, 'USE_SSL' => nil do
      assert_equal 'localhost:3000', AppHost.domain_with_port
      assert_equal 'http', AppHost.protocol
      refute AppHost.use_ssl?
    end
  end
end
