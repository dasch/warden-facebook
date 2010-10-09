ENV['RACK_ENV'] ||= 'development'

begin
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  require "rubygems"
  require "bundler"
  Bundler.setup
end

Bundler.require(:default, :test)

$LOAD_PATH << File.dirname(__FILE__) + '/lib'
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'warden', 'facebook'))
require File.expand_path(File.join(File.dirname(__FILE__), 'test', 'app'))

run Example.app
