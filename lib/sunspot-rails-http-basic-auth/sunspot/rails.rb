module Sunspot
  module Rails
    class <<self
      private

      def master_config(sunspot_rails_configuration)
        config = Sunspot::Configuration.build
        config.solr.url = URI::HTTP.build(
          :host => sunspot_rails_configuration.master_hostname,
          :port => sunspot_rails_configuration.master_port,
          :path => sunspot_rails_configuration.master_path,
          :userinfo => [sunspot_rails_configuration.master_user, sunspot_rails_configuration.master_password]
        ).to_s
        config
      end

      def slave_config(sunspot_rails_configuration)
        config = Sunspot::Configuration.build
        config.solr.url = URI::HTTP.build(
          :host => configuration.hostname,
          :port => configuration.port,
          :path => configuration.path,
          :userinfo => [sunspot_rails_configuration.user, sunspot_rails_configuration.password]
        ).to_s
        config
      end
    end
  end
end
