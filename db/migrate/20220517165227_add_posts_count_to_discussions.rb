class AddPostsCountToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :posts_counts, :integer, default: 0
  end
end
