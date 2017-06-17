require 'spec_helper'

describe Video, :type => :model do
  before(:each) do
    test = Video.create(id:1, title: "Almost Famous", subscription_required: false)
  end

  it "finds a video" do
    expect{ Video.find(1) }.not_to raise_error(ActiveRecord::RecordNotFound)
  end
end
