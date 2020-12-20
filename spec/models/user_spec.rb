require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録がうまくいくとき' do
      it 'nicknameとemail、password、last_name、first_name、last_kana、first_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは＠を含まなければ登録できない' do
        @user.email = "testtest.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_kanaが空だと登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'first_kanaが空だと登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'birth_dateが空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'passwordが6文字未満だと登録できない' do
        @user.password = 'test0'
        @user.password_confirmation = 'test0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end
      it '重複したnicknameが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Nickname has already been taken')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'last_nameが半角英字では登録できない' do
        @user.last_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
      end
      it 'last_nameが半角数字では登録できない' do
        @user.last_name = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name に全角文字を使用してください")
      end
      it 'first_nameが半角英字では登録できない' do
        @user.first_name = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
      end
      it 'first_nameが半角数字では登録できない' do
        @user.first_name = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name に全角文字を使用してください")
      end
      it 'first_kanaが英字では登録できない' do
        @user.first_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana 全角カタカナのみで入力して下さい")
      end
      it 'first_kanaが漢字では登録できない' do
        @user.first_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana 全角カタカナのみで入力して下さい")
      end
      it 'first_kanaが数字では登録できない' do
        @user.first_kana = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana 全角カタカナのみで入力して下さい")
      end
      it 'last_kanaが英字では登録できない' do
        @user.last_kana = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角カタカナのみで入力して下さい")
      end
      it 'last_kanaが漢字では登録できない' do
        @user.last_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角カタカナのみで入力して下さい")
      end
      it 'last_kanaが数字では登録できない' do
        @user.last_kana = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角カタカナのみで入力して下さい")
      end
    end
  end
end
