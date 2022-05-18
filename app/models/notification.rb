# frozen_string_literal: true

class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit ->  { broadcast_notification_count }
  after_destroy_commit -> { broadcast_notification_count }

private

  def broadcast_notification_count
    broadcast_action_to(
      "notifications",
      action: :replace,
      target: "notifications_count",
      partial: "shared/notifications_count",
      locals: { count: recipient.notifications.unread.count }
    )
  end
end
