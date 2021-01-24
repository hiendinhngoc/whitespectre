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
FactoryBot.define do
  factory :group_event do
    description { Faker::Lorem.sentence }
    name { "Group Event" }
    start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 1) }
    end_time { Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 10) }
    location { Faker::Address.state }
    status { "draft" }
    duration { Faker::Number.number(digits: 2) }
  end
end
