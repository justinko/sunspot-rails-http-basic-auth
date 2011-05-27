require 'rsolr'
require 'sunspot/rails'

require 'sunspot-rails-http-basic-auth/rsolr/connection/net_http'
require 'sunspot-rails-http-basic-auth/sunspot/rails'
require 'sunspot-rails-http-basic-auth/sunspot/rails/configuration'


if Rails::VERSION::MAJOR == 2
  # reload the session that was already initialized when sunspot-rails gem loaded
  Sunspot.session = Sunspot::Rails.build_session
end
