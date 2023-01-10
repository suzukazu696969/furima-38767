require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'last_name、first_name、last_name_kana、first_name_kana、nickname、email、passwordとpassword_confirmation、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名を入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓(カナ)を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名(カナ)を入力してください")
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'last_nameが全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.last_name = 'a00006'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓は不正な値です")
      end
      it 'first_nameが全角(漢字、ひらがな、カタカナ)でないと登録できない' do
        @user.first_name = 'a00006'
        @user.valid?
        expect(@user.errors.full_messages).to include("名は不正な値です")
      end
      it 'last_name_kanaが全角(カタカナ)でないと登録できない' do
        @user.last_name_kana = 'a00藍あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓(カナ)は不正な値です")
      end
      it 'first_name_kanaが全角(カタカナ)でないと登録できない' do
        @user.first_name_kana = 'a00藍あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名(カナ)は不正な値です")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが数字のみの場合は登録できない' do
        @user.password = '000008'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが英字のみの場合は登録できない' do
        @user.password = 'ytytyt'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが全角を含む場合は登録できない' do
        @user.password = '000sadあ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
    end
  end
end
