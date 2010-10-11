Facebook Connect for Warden
===========================

A [Warden](http://github.com/hassox/warden) strategy that provides Facebook
Connect authentication through OAuth2.

The implementation is based on Corey Donohoe's
[warden-github](http://github.com/atmos/warden-github).

Usage
-----

    use Warden::Manager do |manager|
      manager.default_strategies :facebook
      manager.failure_app = BadAuthentication

      manager[:facebook_callback_url] = '/auth/facebook/callback'
      manager[:facebook_app_id]       = 'your_app_id'
      manager[:facebook_app_secret]   = 'your_app_secret'
      manager[:facebook_scopes]       = 'email,offline_access'
    end


License
-------

Copyright (c) 2010 Corey Donohoe and Daniel Schierbeck

See LICENSE for details.
