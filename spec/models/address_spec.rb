require 'rails_helper'

RSpec.describe Address, type: :model do
  
  before do
    @address = build(:address)
  end
  
  describe '住所登録ができる' do
    it '全て入力された状態' do
      expect(@address).to be_valid
    end

    it '郵便番号がない' do
      @address.postcode = ''
      expect(@address).to be_valid
    end

    it '住所（番地欄）がない' do
      @address.place = ''
      expect(@address).to be_valid
    end

    it '住所（建物欄）がない' do
      @address.place = ''
      expect(@address).to be_valid
    end
  end

  describe '住所登録ができない' do
    it '緯度がない' do
      @address.latitude = nil
      @address.valid?
      expect(@address.errors.messages[:latitude]).to include 'を入力してください'
    end

    it '経度がない' do
      @address.longitude = nil
      @address.valid?
      expect(@address.errors.messages[:longitude]).to include 'を入力してください'
    end
  end
end
