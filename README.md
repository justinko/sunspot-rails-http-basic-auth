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

## License

sunspot-rails-http-basic-auth is released under the MIT license. See LICENSE for details.

## Copyright

Copyright (c) 2011 Justin Ko