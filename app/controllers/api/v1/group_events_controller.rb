# frozen_string_literal: true

class Api::V1::GroupEventsController < ApplicationController
  before_action :set_group_event, only: [:show, :update, :destroy]
  before_action :set_current_user

  def index
    @group_events = @current_user.group_events
    render json: GroupEventSerializer.new(@group_events).serializable_hash
  end

  def create
    group_event = @current_user.group_events.new(group_event_params)

    if group_event.save
      render json: GroupEventSerializer.new(group_event).serializable_hash, status: :created
    else
      render json: group_event.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: GroupEventSerializer.new(@group_event).serializable_hash
  end

  def update
    if @group_event.update(group_event_params)
      render json: GroupEventSerializer.new(@group_events).serializable_hash
    else
      render json: group_event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @group_event.destroy
    head :no_content
  end

  private
    def group_event_params
      params.permit(
        :description,
        :duration,
        :end_time,
        :location,
        :name,
        :start_time,
        :status
      )
    end

    def set_group_event
      @group_event = GroupEvent.find(params[:id])
    end

    def set_current_user
      @current_user = User.first # temporary
    end
end
