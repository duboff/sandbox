require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has a factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end
=begin
  it 'is valid with email, first_name, password, password_confirmation, and remember token' do
    user = build_stubbed(:user)
    expect(user).to be_valid
  end
  it 'is invalid without email' do
    user = build_stubbed(:user, email: nil)
    expect(user).to have(2).errors_on(:email)
  end
  it 'is invalid without first_name' do
    user = build_stubbed(:user, first_name: nil)
    expect(user).to have(1).errors_on(:first_name)
  end
  it 'has lower case email' do
    user = create(email:'Jungle@TheBook.Net')
    expect(user.email).to eq 'jungle@thebook.net'
  end

  it 'has 51 state options' do
    expect(User::STATES.count).to eq 51 
  end
  it 'has 3 marital status options' do
    expect(User::MARITAL_STATUSES.count).to eq 3
  end
  describe 'authentication' do
    it 'is invalid without password' do 
      user = build_stubbed(:user, password: nil)
      expect(user).to have(1).errors_on(:password)
    end
    it 'is invalid with duplicate emails' do
      User.create(name: 'Iron Man', email:'jungle@thebook.net', password: 'hellocar', password_confirmation: 'hellocar', remember_token: 'hellocar')
      user = User.new(name: 'Iron Man', email:'jungle@thebook.net', password: 'hellocar', password_confirmation: 'hellocar', remember_token: 'hellocar')
      expect(user).to have(1).errors_on(:email)
    end
    it 'is invalid with password length less than 8' do
      user = build_stubbed(:user, password: 'b'*7)
      expect(user).to have(1).errors_on(:password)
    end
    it 'is valid with password length is 8' do
      user = build_stubbed(:user, password: 'b'*8)
    end
    it 'is invalid with password length greater than 30' do
      user = build_stubbed(:user, password: 'b'*31)
      expect(user).to have(1).errors_on(:password)
    end
    it 'is valid with password length is 30' do
      user = build_stubbed(:user, password: 'b'*30)
      expect(user).to be_valid
    end
  end
  describe "type checking" do
    it 'is invalid if it does not pass email regex' do
      user = build_stubbed(:user, email: 'bagel')
      expect(user).to have(1).errors_on(:email)
    end
    it 'is invalid if it does not pass name regex' do
      user = build_stubbed(:user, name: '@bagel')
      expect(user).to have(1).errors_on(:name)
    end
  end
  describe "user's children models" do
    before :each do
      @user = User.create(name: 'Iron Man', email:'jungle@thebook.net', password: 'hellocar', password_confirmation: 'hellocar', remember_token: 'hellocar')
    end

    after :all do
      User.destroy_all
    end

    context "partner" do
      it 'accepts attributes for partner' do
        @user.build_partner
        expect(@user.partner).not_to eq nil
      end
      it 'is not destroyed when partner is destroyed' do
        @user.create_partner(name: 'Lucy')
        Partner.find_by_name('Lucy').destroy
        expect(@user).not_to eq nil
      end
      it 'saves partner on user save' do
        @user.build_partner(name: 'Lucy')
        @user.save
        expect(Partner.find_by_name('Lucy')).not_to eq nil
      end
    end
    context "child" do
      it 'accepts attributes for child' do
        @user.children.create(name: 'Lucy')
        @child = Child.find_by_name('Lucy')
        expect(@child).not_to eq nil
      end
      it 'is not destroyed when child is destroyed' do
        @user.children.create(name: 'Lucy')
        Child.find_by_name('Lucy').destroy
        @child = Child.find_by_name('Lucy')
        expect(@user).not_to eq nil
      end
      it 'saves child on user save' do
        @user.children.build(name: 'Lucy')
        @user.save
        @child = Child.find_by_name('Lucy')
        expect(@child).not_to eq nil
      end
    end
    context "other_asset" do
      it 'accepts attributes for other_asset' do
        @user.other_assets.create(name: 'Fund')
        @asset = OtherAsset.find_by_name('Fund')
        expect(@asset).not_to eq nil
      end
      it 'is not destroyed when other_asset is destroyed' do
        @user.other_assets.create(name: 'Fund')
        OtherAsset.find_by_name('Fund').destroy
        expect(@user).not_to eq nil
      end
      it 'saves other_asset on user save' do
        @user.other_assets.build(name: 'Fund')
        @user.save
        @asset = OtherAsset.find_by_name('Fund')
        expect(@asset).not_to eq nil
      end
    end
    context "retirement_account" do
      it 'accepts attributes for retirement_account' do
        @user.retirement_accounts.create(name: 'acct', account_type: '401k')
        @acct = RetirementAccount.find_by_name('acct')
        expect(@acct).not_to eq nil
      end
      it 'is not destroyed when retirement_account is destroyed' do
        @user.retirement_accounts.create(name: 'acct', account_type: '401k')
        RetirementAccount.find_by_name('acct').destroy
        expect(@user).not_to eq nil
      end
      it 'saves retirement_account on user save' do
        @user.retirement_accounts.build(name: 'acct', account_type: '401k')
        @user.save
        @acct = RetirementAccount.find_by_name('acct')
        expect(@acct).not_to eq nil
      end
    end
  end
=end
end
