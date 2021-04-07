require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep 0.1
  end

  describe 'ユーザー新規登録1ページ目' do
    context 'ユーザー情報が保存できて、次のページに進める時' do
      it '必須項目が全て正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end

      it '画像が選択されていなくても保存できる' do
        @user.image = nil
        expect(@user).to be_valid
      end
    end

    context 'ユーザー情報が保存できず、次のページに進めない時' do
      it 'ニックネームが入力されていないと保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'ニックネームが11文字以上だと保存できない' do
        @user.nickname = 'a' * 11
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは10文字以内で入力してください')
      end

      it '生年月日が入力されていないと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end

      it '性別が選択されていないと登録できない' do
        @user.gender_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選択してください')
      end

      it 'メールアドレスが入力されていないと保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it 'メールアドレスに@が含んでいないと保存できない' do
        @user.email = 'aaaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end

      it '同じメールアドレスは保存できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

      it 'パスワードが入力されていないと保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'パスワードが11文字以下だと保存できない' do
        @user.password = 'abcdef12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは12文字以上で入力してください')
      end

      it 'パスワードが21文字以上だと保存できない' do
        @user.password = 'abcdefghij12345678910'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは20文字以内で入力してください')
      end

      it 'パスワードが全角だと保存できず、半角英数混合でないといけない' do
        @user.password = 'aaaaああああａａａａ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混合で入力してください')
      end

      it 'パスワードが半角であっても、英文字のみでは保存できない' do
        @user.password = 'abcdefghijkl'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混合で入力してください')
      end

      it 'パスワードが半角であっても、数字のみで保存できない' do
        @user.password = '123456789101'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数混合で入力してください')
      end

      it 'パスワードとパスワード（確認用）が一致していないと保存できない' do
        @user.password = 'abcdef123456'
        @user.password_confirmation != @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end
