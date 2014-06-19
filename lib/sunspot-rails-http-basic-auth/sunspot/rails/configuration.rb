module Sunspot
  module Rails
    class Configuration

      # User used for basic http auth
      def user
        @user ||= user_configuration_from_key('solr', 'user')
      end

      # Master user used for basic http auth, in case, you have separate solr instances you read and write (master_solr) to.
      def master_user
        @master_user ||= user_configuration_from_key('master_solr', 'user')
      end

      # Password for basic http auth
      def password
        @password ||= user_configuration_from_key('solr', 'password')
      end

      # Master password for basic http auth
      def master_password
        @master_password ||= user_configuration_from_key('master_solr', 'password')
      end

    end
  end
end
