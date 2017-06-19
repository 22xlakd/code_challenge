require 'spec_helper'

describe VideosHelper, type: :helper do
  let(:video){ Video.create(title:"Some video", identifier: "57sfjr7sajh") }

  it "returns video widget" do
    expect(helper.video_player(video).is_a?(String)).to be true
    expect(helper.video_player(video).include?("https:")).to be true 
    expect(helper.video_player(video).include?("script")).to be true 
    expect(helper.video_player(video).include?("id=")).to be true 
  end
end
