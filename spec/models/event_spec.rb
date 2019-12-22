require 'rails_helper'

RSpec.describe Event, type: :model do

  before do
    @event = build(:event)
  end

  describe 'イベント登録できる' do
    it '全て入力する' do
      expect(@event).to be_valid
    end
  end

  describe 'イベント登録できない' do
  
  end
end
