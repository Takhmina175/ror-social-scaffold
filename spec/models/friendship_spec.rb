require 'rails_helper'
RSpec.describe Friendship, type: :model do
before(:each) do
  @user=User.create!(name: "user", email: "user@m", password: "123456", password_confirmation: "123456")
  @friend=User.create!(name: "friend", email: "friend@m", password: "123456", password_confirmation: "123456")
end

describe 'validations' do 
  it { expect(Friendship).to validate_presence_of(1, 2).with_message("Friend request sent.")}

  it { expect(Friendship).to_not validate_presence_of(1, nil).with_message("Friend can't be blank")}

  it { expect(Friendship).to_not validate_presence_of(nil, 2).with_message("User can't be blank")} 
end 
end