require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = build(:user)
  end

  describe 'ユーザーが作成できる' do
    it '全て入力された状態でユーザー作成できる' do
      expect(@user).to be_valid
    end

    it 'アバターが入力されてなくてもユーザー作成できる' do
      @user.avatar = ''
      expect(@user).to be_valid
    end
  end

  describe 'ユーザーが作成できない' do
    it 'パスワードが5桁' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.messages[:password]).to include 'は6文字以上に設定して下さい。'
    end

    it '設定したパスワードが確認用と違う' do
      @user.password_confirmation = 'aaaaab'
      @user.valid?
      expect(@user.errors.messages[:password_confirmation]).to include 'とパスワードの入力が一致しません'
    end

    it 'ニックネームがない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.messages[:nickname]).to include 'を入力してください'
    end

    it 'emailがない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.messages[:email]).to include 'が入力されていません。'
    end

    it 'emailの中に@マーク以降がない' do
      @user.email = 'aaa'
      @user.valid?
      expect(@user.errors.messages[:email]).to include 'は有効でありません。'
    end
  end

end
