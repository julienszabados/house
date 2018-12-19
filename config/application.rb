require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module House
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = 'Paris'
    config.i18n.load_path += Dir[Rails.root.join('locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr

    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders', '*')]
    config.autoload_paths += Dir[Rails.root.join('lib', '*')]
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**/}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'classes', '{**/}')]    
  end
end
