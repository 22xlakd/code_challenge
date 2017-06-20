require 'spec_helper'

describe User, :type => :model do
  it "finds a User" do
    User.create(id:1, username: "22xlakd", password: "123456")
    expect{ User.find(1) }.not_to raise_error
  end

  context "#validations" do
    it "validates username presence" do
      c_user = User.new(password: "12345")

      expect(c_user.save).to be false
      expect(c_user.errors.count).to eq(1)
      expect(c_user.errors.full_messages).to eq(["Username can't be blank"])
    end

    it "validates username uniqness" do
      User.create(password:"123456", username: "john_doe")
      c_user = User.new(password: "111111", username:"john_doe") 

      expect(c_user.save).to be false
      expect(c_user.errors.full_messages).to eq(["Username has already been taken"])
    end

    it "validates password presence" do
      c_user = User.new(username: "test_user")

      expect(c_user.save).to be false
      expect(c_user.errors.count).to eq(1)
      expect(c_user.errors.full_messages).to eq(["Password can't be blank"])
    end
  end

  context "#authentication" do
    let(:current_user){ User.create(username: "22xlakd", password: "123456") }

    it "authenticates user" do
      expect(current_user.authenticate("123456")).to eq(current_user)
    end

    it "returns false when password is incorrect" do
      expect(current_user.authenticate("123456789")).to be false
    end
  end

  context "#get_access_token" do
    let!(:user){ User.create(id: 10, username:"test@test.com", password:"password") }

    it "returns user with access_token" do
      expect(User.get_api_user("test@test.com","password")).to eq(user)
      expect(User.get_api_user("test@test.com","password").access_token).not_to eq(nil)
    end

    it "returns nil when user doesn't exists" do
      expect(User.get_api_user("inexistent@test.com","123456")).not_to eq(user)
      expect(User.get_api_user("inexistent@test.com","123456")).to be nil
    end
  end
end
