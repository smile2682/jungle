require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    it "is valid when all the user info is given" do
      @user = User.new(first_name:"Chris", last_name: "Sun", email: "Chrisun@gmail.com", password: "chrisun", password_confirmation: "chrisun")
      expect(@user).to be_valid
    end

    it "is not valid when the first name is not given" do
      @user = User.new(first_name:nil, last_name: "Sun", email: "Chrisun@gmail.com", password: "chrisun", password_confirmation: "chrisun")
      expect(@user).to_not be_valid
    end

    it "is not valid when the last name is not given" do
      @user = User.new(first_name:"Chris", last_name: nil, email: "Chrisun@gmail.com", password: "chrisun", password_confirmation: "chrisun")
      expect(@user).to_not be_valid
    end
  
    it "is not valid when the email is not given" do
      @user = User.new(first_name:"Chris", last_name: "nil", email: nil, password: "chrisun", password_confirmation: "chrisun")
      expect(@user).to_not be_valid
    end

    it "is not valid when the password is not given" do
      @user = User.new(first_name:"Chris", last_name: "nil", email: "nil@nil.com", password: nil, password_confirmation: "chrisun")
      expect(@user).to_not be_valid
    end

    it "is not valid when the password confirmation is not given" do
      @user = User.new(first_name:"Chris", last_name: "nil", email: "nil@nil.com", password:"chrisun" , password_confirmation: nil)
      expect(@user).to_not be_valid
    end
  
    it "is not valid when the password confirmation does not match the password" do
      @user = User.new(first_name:"Chris", last_name: "nil", email: "nil@nil.com", password:"chrisun" , password_confirmation: "chrismoon")
      expect(@user).to_not be_valid
      puts 'ERROR MESSAGE', @user.errors.full_messages
    end

    it "is not valid when the password is less than 5 characters" do
      @user = User.new(first_name:"Chris", last_name: "nil", email: "nil@nil.com", password:"chri" , password_confirmation: "chris")
      expect(@user).to_not be_valid
    end

    it "is not valid when the email of a registering user is the same as another already-registered user" do
      @user1 = User.new(first_name:"Chris", last_name: "sun", email: "nile@NILe.com", password:"chrisun" , password_confirmation: "chrisun")
      expect(@user1).to be_valid
      @user1.save

      @user2 = User.new(first_name:"Chris", last_name: "moon", email: "nile@nile.com", password:"chrismoon" , password_confirmation: "chrismoon")
      expect(@user2).to_not be_valid

    end
  end

  

# should be in 3 different tests
    describe '.authenticate_with_credentials' do
     it "is valid if the email with space and different-to-register case and password is correct" do
     @user = User.new(first_name:"Chris", last_name: "nil", email: "ni@ni.com", password:"chris" , password_confirmation: "chris")
     @user.save
     expect(User.authenticate_with_credentials('   nI@ni.COM', 'chris')).to eq(@user)
     end
    end
end