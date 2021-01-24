# frozen_string_literal: true

# == Schema Information
#
# Table name: group_events
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text
#  duration    :integer
#  end_time    :datetime
#  location    :string
#  name        :string
#  start_time  :datetime
#  status      :string           default("draft")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_group_events_on_deleted_at  (deleted_at)
#  index_group_events_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class GroupEvent < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  validates_presence_of :name

  validates_presence_of :description, if: :published?
  validates_presence_of :location, if: :published?
  validates_presence_of :start_time, if: :published?
  validates_presence_of :end_time, if: :published?
  validates_presence_of :duration, if: :published?

  enum status: { draft: 0, published: 1 }

  private
    def published?
      status == "published"
    end
end
