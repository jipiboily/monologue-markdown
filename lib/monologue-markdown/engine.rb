module MonologueMarkdown
  class Engine < ::Rails::Engine
    isolate_namespace MonologueMarkdown

    config.generators.test_framework :rspec, :view_specs => false, :fixture => false
    config.generators.stylesheets     false
    config.generators.fixture_replacement :factory_girl
    config.generators.integration_tool :rspec
  end
end
