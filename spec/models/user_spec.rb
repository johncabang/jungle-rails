require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here
    it "Requires password and password confirmation to create new user" do
      @user = User.new(first_name: "James", last_name: "Moriarty", email: "example@email.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it "Requires a unique email when creating a new user" do
      @user = User.new(first_name: "James", last_name: "Moriarty", email: "example@email.com", password: "password", password_confirmation: "password")
      @user.save
      @user2 = User.new(first_name: "John", last_name: "Watson", email: "example@email.com", password: "newpassword", password_confirmation: "newpassword")
      expect(@user2).to be_invalid
    end

    it "Requires an email when creating a new user" do
      @user = User.new(first_name: "James", last_name: "Moriarty", email: "example@email.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it "Requires first name when creating a new user" do
      @user = User.new(first_name: nil, last_name: "Moriarty", email: "example@email.com", password: "password", password_confirmation: "password")
      expect(@user).to be_invalid
    end

    it "Requires last name when creating a new user" do
      @user = User.new(first_name: "James", last_name: nil, email: "example@email.com", password: "password", password_confirmation: "password")
      expect(@user).to be_invalid
    end

    it "Requires password to have a minimum length of 6 when creating a new user" do
      @user = User.new(first_name: "James", last_name: "Moriarty", email: "example@email.com", password: "12345", password_confirmation: "12345")
      expect(@user).to be_invalid
    end
    

  describe '.authenticate_with_credentials' do
    it "Should authenticate with whitespaces around email" do
      @user = User.new(first_name: "James", last_name: "Moriarty", email: "example@email.com", password: "password", password_confirmation: "password")
      @user.save
      @user2 = User.authenticate_with_credentials("    example@email.com", "password")
      expect(@user2).to eql(@user)
    end

    it "Should authenticate with an email with different cases" do
      @user = User.new(first_name: "James", last_name: "Moriarty", email: "example@email.com", password: "password", password_confirmation: "password")
      @user.save
      @user2 = User.authenticate_with_credentials("EXAmple@email.COM", "password")
      expect(@user2).to eql(@user)
    end
  end

  end
end