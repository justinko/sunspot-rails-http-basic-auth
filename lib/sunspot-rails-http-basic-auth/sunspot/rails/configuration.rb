module Sunspot
  module Rails
    class Configuration
      
      def user
        @user ||= user_configuration_from_key('solr', 'user')
      end
      
      def master_user
        @master_user ||= user_configuration_from_key('master_solr', 'user')
      end
      
      def password
        @password ||= user_configuration_from_key('solr', 'password')
      end
      
      def master_password
        @master_password ||= user_configuration_from_key('master_solr', 'password')
      end
      
    end
  end
end
