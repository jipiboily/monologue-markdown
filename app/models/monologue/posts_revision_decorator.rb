Monologue::PostsRevision.class_eval do
  def content
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(read_attribute(:content))
  end
end