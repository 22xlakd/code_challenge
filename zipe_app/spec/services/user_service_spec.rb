require 'spec_helper'

describe UserService do
  context "#login user" do
    it "raises an error if params missing" do
      expect{ subject.authenticate() }.to raise_error(ArgumentError, "Username and Password can't be nil")
    end

    it "returns user info" do
      expect(subject.authenticate('test@test.com','password').class).to eq(Hash)
      expect(subject.authenticate('test@test.com','password')[:access_token]).not_to eq(nil)
    end

    it "return Notfound when API returns 404" do
      response = double
      response.stub(:code) { 404 }
      RestClient.stub(:post) { response }

      expect(subject.authenticate('test@test.com','password')[:error]).to  eq("NotFound")
      expect(subject.authenticate('test@test.com','password')[:error_message]).to  eq("Source not found")
    end

    it "returns unauthorized when user doesn't exists" do
      expect(subject.authenticate('test@test.com','password1234')[:error]).to eq('Unauthorized')
      expect(subject.authenticate('test@test.com','password1234')[:error_message]).to eq('Username or password invalid')
    end
  end
end
