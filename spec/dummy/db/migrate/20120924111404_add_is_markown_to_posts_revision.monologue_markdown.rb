# This migration comes from monologue_markdown (originally 20120924111013)
class AddIsMarkownToPostsRevision < ActiveRecord::Migration
  def up
    add_column :monologue_posts_revisions, :is_markdown, :boolean
    ::Monologue::PostsRevision.update_all(:is_markdown => false)
  end

  def down
    remove_column :monologue_posts_revisions, :is_markdown
  end
end