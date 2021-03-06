require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nickname, email, encrypted_password, first_name, last_name, first_name_kana, last_name_kana, birth_date が存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空では登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        
        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailに@が含まれてい無ければ登録できない" do
          @user.email = "hoge-gmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        
        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "パスワードは半角英数字混合で無ければ登録できない" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end

        it "パスワードは半角英数字混合で無ければ登録できない" do
          @user.password = "123456"
          @user.password = "ＡＢＣＤＥ"
          @user.password_confirmation = "123456"
          @user.password_confirmation = "ＡＢＣＤＥ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end

        it "パスワードは半角英数字混合で無ければ登録できない" do
          @user.password = "ＡＢＣＤＥ"
          @user.password_confirmation = "ＡＢＣＤＥ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
        
        it "passwordが5文字以下であれば登録できない" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "first_nameが空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "first_nameが全角（漢字・ひらがな・カタカナ）で入力しなければ登録出来ない" do
          @user.first_name = "ishikura"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name Full-width characters")
        end

        it "last_nameが空では登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "last_nameが全角（漢字・ひらがな・カタカナ）で入力しなければ登録出来ない" do
          @user.last_name = "ishikura"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name Full-width characters")
        end

        it "first_name_kanaが空では登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "first_name_kanaのフリガナは全角（カタカナ）で入力する" do
          @user.first_name_kana = "misao"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
        end

        it "last_name_kanaが空では登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it "last_name_kanaのフリガナは全角（カタカナ）で入力する" do
          @user.last_name_kana = "misao"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
        end

        it "birth_dateが空では登録できない" do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end