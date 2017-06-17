require 'spec_helper'

describe VideoService do
  it "list videos" do
    all_videos = subject.list_videos()

    expect(all_videos.class).to eq(Array)
    expect(all_videos.first.class).to eq(JSON)
  end
end
