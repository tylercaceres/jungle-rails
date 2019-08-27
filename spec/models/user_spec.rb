require 'rails_helper'

describe User do
  before(:each) do
    @user = User.new
    @user.first_name = 'tyler'
    @user.last_name = 'caceres'
    @user.email = 'tyler.caceres@gmail.com'
    @user.password = 'PASSWORD123'
    @user.password_confirmation = 'PASSWORD123'
  end
  describe 'password fields' do
    it 'true when password and password confirmation fields are the same' do
      @user.save
      expect(@user).to be_valid
    end

    it 'false when password and password confirmation fields are not the same' do
      @user.password_confirmation = '123457'
      @user.save
      expect(@user).not_to be_valid
    end
  end

    describe 'emails must be unique' do
      it 'same emails cannot be added' do
        @user.save
        @user2 = User.new(first_name: 'tyler', last_name: 'caceres', password: 'test_pw', password_confirmation: 'test_pw', email: 'tyler.CACERES@gmail.com')
        @user2.save
        expect(@user2).not_to be_valid
      end

      it 'different emails can be added' do
        @user.save
        @user2 = User.new(first_name: 'tyler', last_name: 'caceres', password: 'test_pw', password_confirmation: 'test_pw', email: 'tyler.CACERES2@gmail.com')
        @user2.save
        expect(@user2).to be_valid
      end
    end

  describe 'password length confirmation' do
    it 'saves when length >= 6' do
      @user.save
      expect(@user).to be_valid
    end

    it 'does not save when length < 6' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.save
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns true if email and password match record' do
      @user.save
      expect(User.authenticate_with_credentials(@user.email,@user.password)).not_to be nil
    end

    it 'returns false if email and password do not match record' do
      @user.save
      expect(User.authenticate_with_credentials('test@gmail.com',@user.password)).to be nil
    end

    it 'extra spaces should successfully log in' do
      @user.save
      expect(User.authenticate_with_credentials('   tyler.caceres@gmail.com   ',@user.password)).not_to be nil
    end

    it 'returns true if email is different case than stored email' do
      @user.save
      expect(User.authenticate_with_credentials(@user.email.upcase,@user.password)).not_to be nil
    end

  end

end
