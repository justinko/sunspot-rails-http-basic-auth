# sunspot-rails-http-basic-auth

All this gem does is patch rsolr and sunspot_rails to support
http basic authentication. In your `sunspot.yml` file, you can add
`user` and `password` keys:

    development:   
      solr:
        host: localhost
        port: 8982
        path: /solr
        user: theuser
        password: thepassword
        log_level: INFO
    
## Copyright

Copyright (c) 2011 Justin Ko. See LICENSE for details.