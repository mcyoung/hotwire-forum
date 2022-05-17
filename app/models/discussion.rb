class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  validates :name, presence: true

  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts

  # Following string should match what's on the index.html.erb turbo_stream_from
  after_create_commit ->  { broadcast_prepend_to "discussions" }
  after_update_commit ->  { broadcast_replace_to "discussions" }
  after_destroy_commit -> { broadcast_remove_to "discussions" }

  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
  end
end
