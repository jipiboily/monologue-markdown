Rails.application.routes.draw do

  mount MonologueMarkdown::Engine => "/monologue-markdown"
end
