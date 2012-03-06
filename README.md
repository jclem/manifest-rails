# Manifest

Manifest is a [Rails::Engine][rails_engine] content management system, packaged as the RubyGem [manifest-rails][manifest_rails_gem].

It was created out of frustration with the fact that many content management systems require hacks or breaking with their own conventions in order to implement true custom data types, and the fact that many content management systems require view-editing to be done from within the application itself, persisting view templates to the database.

In Manifest, custom data types are sets of Rails models, controllers, and views that Manifest has visibility of. This means that Manifest data types can either be generated with the built-in `manifest:data_type` generator, or can be constructed by hand and easily tied into Manifest.

Views in Manifest are views in Rails. Editing these views and templates is a matter of editing the public-facing views in `app/views` and any custom Manifest views in `app/views/manifest`.

## Getting Started

Getting started with Manifest is as easy as:

1. Add it to your `Gemfile`.
2. Require it in your `config/application.rb`.
3. Run the install generator and migrate the database.

Detailed instructions can be found in the [Wiki][wiki] on the [Getting Started][getting_started] page.

## License

Manifest was created by [Jonathan Clem][jclem] and is licensed under the [MIT license][license].

[rails_engine]: http://api.rubyonrails.org/classes/Rails/Engine.html
[manifest_rails_gem]: http://rubygems.org/gems/manifest-rails
[wiki]: https://github.com/jclem/manifest-rails/wiki
[getting_started]: https://github.com/jclem/manifest-rails/wiki/Getting-Started
[jclem]: http://jclem.net
[license]: https://github.com/jclem/manifest-rails/blob/master/MIT-LICENSE