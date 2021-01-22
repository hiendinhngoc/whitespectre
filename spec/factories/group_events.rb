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
FactoryBot.define do
  factory :group_event do
    
  end
end
