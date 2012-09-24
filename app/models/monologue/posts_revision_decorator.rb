Monologue::PostsRevision.class_eval do
  def is_markdown?
    self.is_markdown != false
  end

  def content
    if self.is_markdown? && !in_admin?(caller)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
      return markdown.render(read_attribute(:content))
    end
    read_attribute(:content)
  end

  def in_admin? caller
    caller.each do |c|
      return true if c.include? "app/controllers/monologue/admin/posts_controller.rb"
    end
    return false
  end
end