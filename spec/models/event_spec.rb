require 'rails_helper'

RSpec.describe Event, type: :model do

  before do
    @event = build(:event)
  end

  describe 'イベント登録できる' do
    it '全て入力する' do
      expect(@event).to be_valid
    end

    it 'urlの入力がない' do
      @event.url = ''
      @event.valid?
      expect(@event).to be_valid
    end
  end

  describe 'イベント登録できない' do
    it '開始日の入力がない' do
      @event.start = nil
      @event.valid?
      expect(@event.errors.messages[:start]).to include 'を入力してください'
    end

    it '終了日の入力がない' do
      @event.end_on = nil
      @event.valid?
      expect(@event.errors.messages[:end_on]).to include 'を入力してください'
    end

    it 'カテゴリーの入力がない' do
      @event.category_id = nil
      @event.valid?
      expect(@event.errors.messages[:category_id]).to include 'を入力してください'
    end

    # it '終了日が開始日より前' do
    #   @event.end_on = Date.today - 1
    #   @event.valid?
    #   expect(@event.errors.messages[:end_on]).to include '終了日は開始日以降にしてください'
    # end
  
  end
end
