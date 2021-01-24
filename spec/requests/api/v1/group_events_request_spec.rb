# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::V1::GroupEvents", type: :request do
  let(:user) { create(:user) }
  let!(:group_events) { create_list(:group_event, 10, user_id: user.id) }
  let(:group_event_id) { group_events.first.id }

  describe "GET /group_events" do
    before { get "/api/v1/group_events", params: {} }

    it "return group events" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns http success" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /group_events/:id" do
    before { get "/api/v1/group_events/#{group_event_id}", params: {} }

    context "when the record exists" do
      it "returns the group_event" do
        expect(json).not_to be_empty
        expect(json["id"].to_i).to eq(group_event_id)
      end

      it "returns http success" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:group_event_id) { 11 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find GroupEvent/)
      end
    end
  end

  describe "POST /group_events" do
    let(:valid_attributes) { attributes_for(:group_event).merge(user_id: user.id) }

    context "when request is valid" do
      before { post "/api/v1/group_events", params: valid_attributes }

      it "creates a group_event" do
        expect(json["attributes"]["name"]).to eq("Group Event")
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      let(:invalid_attributes) { { name: nil } }
      before { post "/api/v1/group_events", params: invalid_attributes }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT /group_events/:id" do
    let(:valid_attributes) { { name: "GroupEvent test 1" } }

    context "when the record exists" do
      before { put "/api/v1/group_events/#{group_event_id}", params: valid_attributes }

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "DELETE /group_events/:id" do
    before { delete "/api/v1/group_events/#{group_event_id}", params: {} }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
