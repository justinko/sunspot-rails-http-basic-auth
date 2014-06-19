require 'rsolr'
require 'sunspot/rails'

require 'sunspot-rails-http-basic-auth/rsolr/connection'
require 'sunspot-rails-http-basic-auth/rsolr/client'
require 'sunspot-rails-http-basic-auth/sunspot/rails'
require 'sunspot-rails-http-basic-auth/sunspot/rails/configuration'

if defined?(Rails) && Rails::VERSION::MAJOR == 2
  Sunspot.session = Sunspot::Rails.build_session
end