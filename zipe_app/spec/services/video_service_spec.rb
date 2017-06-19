require 'spec_helper'

describe VideoService do
  context "#API returns 200 code" do
    it "list videos" do
      all_videos = subject.list_videos()

      expect(all_videos.class).to eq(Array)
      expect(all_videos.first.class).to eq(Video)
    end
  end

  context "#API returns 401 code" do
    it "raises a 404 error when api fails" do
      Rails.configuration.zipe_app_key = "skdjaskldjaskljaklj"

      expect{ subject.list_videos() }.to raise_error(ActionController::RoutingError, "Unauthorized")
    end
  end
end
