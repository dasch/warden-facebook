require 'rubygems'
require 'bundler'
require 'test/unit'

Bundler.require(:default, :test)

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'warden/facebook'
require 'app'

Webrat.configure do |config|
  config.mode = :rack
  config.application_port = 4567
end

class Test::Unit::TestCase
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  def app
    Example.app
  end
end
