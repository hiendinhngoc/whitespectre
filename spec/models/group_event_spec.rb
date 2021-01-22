# frozen_string_literal: true

# == Schema Information
#
# Table name: group_events
#
#  id          :bigint           not null, primary key
#  description :text
#  duration    :integer
#  end_time    :datetime
#  location    :string
#  name        :string
#  start_time  :datetime
#  status      :string           default("draft")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe GroupEvent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
