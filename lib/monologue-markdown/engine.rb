module MonologueMarkdown
  class Engine < ::Rails::Engine
    isolate_namespace MonologueMarkdown

    config.generators.test_framework :rspec, :view_specs => false, :fixture => false
    config.generators.stylesheets     false
    config.generators.fixture_replacement :factory_girl
    config.generators.integration_tool :rspec

    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w( base/epiceditor.css editor/epic-dark.css preview/github.css )
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
