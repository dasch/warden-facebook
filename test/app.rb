module Example
  class App < Sinatra::Base
    enable  :sessions
    enable  :raise_errors
    disable :show_exceptions

    use Warden::Manager do |manager|
      manager.default_strategies :facebook
      manager.failure_app = BadAuthentication

      manager[:facebook_callback_url] = '/auth/facebook/callback'
      manager[:facebook_app_id]       = ENV['FB_APP_ID']
      manager[:facebook_app_secret]   = ENV['FB_APP_SECRET']
      manager[:facebook_scopes]       = 'email,offline_access'
    end

    helpers do
      def ensure_authenticated
        unless env['warden'].authenticate!
          throw(:warden)
        end
      end

      def user
        env['warden'].user
      end
    end

    get '/' do
      ensure_authenticated
      "Hello There, #{user.name}!"
    end

    get '/auth/facebook/callback' do
      ensure_authenticated
      redirect '/'
    end

    get '/logout' do
      env['warden'].logout
      "Peace!"
    end
  end

  class BadAuthentication < Sinatra::Base
    get '/unauthenticated' do
      status 403
      "Unable to authenticate, sorry bud."
    end
  end

  def self.app
    @app ||= Rack::Builder.new do
      run App
    end
  end
end
