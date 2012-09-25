Monologue::PostsRevision.class_eval do
  before_create do
    if self.post.posts_revision_id.nil?
      self.is_markdown = true
    else
      self.is_markdown = self.post.active_revision.is_markdown
    end
  end

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