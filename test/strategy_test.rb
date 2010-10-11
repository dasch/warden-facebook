require File.dirname(__FILE__) + '/helper'

class StrategyTest < Test::Unit::TestCase
  context "With the :facebook strategy:" do
    context "Requesting an URL that requires authentication" do
      setup do
        @response = get '/'
        @uri = Addressable::URI.parse(@response.headers["Location"])
      end

      should "redirect to Facebook" do
        assert_equal 'graph.facebook.com', @uri.host
      end

      should "use HTTPS" do
        assert_equal 'https', @uri.scheme
      end
    end
  end
end
