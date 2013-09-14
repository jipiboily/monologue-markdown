class MergeMarkdownRevisionsIntoPosts < ActiveRecord::Migration
  class Monologue::PostsRevision < ActiveRecord::Base
    attr_accessible :title, :content, :url, :published_at, :post_id
  end

  class Monologue::Post < ActiveRecord::Base
  end

  def up
    Monologue::PostsRevision.reset_column_information
    Monologue::Post.reset_column_information
    add_column :monologue_posts, :is_markdown, :boolean

    Monologue::Post.reset_column_information

    Monologue::Post.all.each do |post|
      latest_revision =  latest_revision_for(post)
      post.is_markdown = latest_revision.is_markdown
      post.save(validate: false)
    end

    remove_column :monologue_posts_revisions, :is_markdown
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private
  def latest_revision_for(post)
    Monologue::PostsRevision.where("post_id = ?", post.id).order("monologue_posts_revisions.updated_at DESC").limit(1).first
  end
end