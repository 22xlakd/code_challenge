require 'spec_helper'

describe Video, :type => :model do
  let(:first_video){ Video.create(title: "Almost Famous trailer", subscription_required: false) }

  it "finds a Video" do
    Video.create(id:1, title: "Finding Nemo")
    expect{ Video.find(1) }.not_to raise_error
  end

  it "saves video successfully" do
    test = Video.new(title: "My awesome video")

    expect(test.save).to be true
  end

  it "deletes video" do
    expect(Video.find(first_video.id).delete).to eq(first_video)
  end
end
