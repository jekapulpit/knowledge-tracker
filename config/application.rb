require_relative 'boot'

require 'rails/all'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KnowledgeTracker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    el_config = {
        host: 'http://localhost:9200/',
        transport_options: {
            request: { timeout: 5 }
        },
    }
    config.load_defaults 5.1
    config.assets.enabled = true
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.generators.javascript_engine = :js
    Elasticsearch::Model.client = Elasticsearch::Client.new(el_config)
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
