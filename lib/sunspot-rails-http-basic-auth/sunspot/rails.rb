module Sunspot
  module Rails
    class <<self
      private

      def master_config(sunspot_rails_configuration)
        build_config do |config|
          config.solr.url = URI::HTTP.build(
            :host => sunspot_rails_configuration.master_hostname,
            :port => sunspot_rails_configuration.master_port,
            :path => sunspot_rails_configuration.master_path,
            :userinfo => [sunspot_rails_configuration.master_user, sunspot_rails_configuration.master_password]
          ).to_s
        end
      end

      def slave_config(sunspot_rails_configuration)
        build_config do |config|
          config.solr.url = URI::HTTP.build(
            :host => sunspot_rails_configuration.hostname,
            :port => sunspot_rails_configuration.port,
            :path => sunspot_rails_configuration.path,
            :userinfo => [sunspot_rails_configuration.user, sunspot_rails_configuration.password]
          ).to_s
        end
      end
      
      def build_config
        config = Sunspot::Configuration.build
        yield config
        config
      end
    end
  end
end
