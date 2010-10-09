module Warden
  module Facebook
    class Proxy
      attr_accessor :client_id, :secret, :scopes, :callback_url

      def initialize(app_id, app_secret, scopes, callback_url)
        @app_id, @app_secret, @scopes, @callback_url = app_id, app_secret, scopes, callback_url
      end

      def client
        @client ||= OAuth2::Client.new(@app_id, @app_secret, :site => 'https://graph.facebook.com')
      end

      def access_token_for(code)
        web_server.get_access_token(code, :redirect_uri => callback_url)
      end

      def authorize_url
        web_server.authorize_url(:scope => scopes, :redirect_uri => callback_url)
      end

      def web_server
        client.web_server
      end
    end
  end
end
