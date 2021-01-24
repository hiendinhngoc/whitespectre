# frozen_string_literal: true

class GroupEventSerializer
  include JSONAPI::Serializer
  attributes :description, :duration, :end_time, :location, :name, :start_time, :status
  belongs_to :user
end
