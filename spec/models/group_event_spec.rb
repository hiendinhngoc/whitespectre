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
require "rails_helper"

RSpec.describe GroupEvent, type: :model do
  it { should validate_presence_of(:name) }
end
