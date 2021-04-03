require 'rails_helper'

RSpec.describe 'ユーザー新規登録1ページ目', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー情報が保存できて、次のページに進める時' do 
    it '正しい情報を入力すればユーザー情報が保存できて次のページに移動する時' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: @user.nickname
      select '男性', from: 'user[gender_id]'
      select '1930', from: 'user[birth_day(1i)]'
      select '1', from: 'user[birth_day(2i)]'
      select '1', from: 'user[birth_day(3i)]'
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      # 「次へ進む」ボタンを押すとアンケート入力ページへ移動する
      click_on ('次へ進む')
      # ユーザー新規登録1ページ目の「次へ進む」ボタンが表示されていないことを確認する
      expect(page).to have_no_content('次へ進む')
    end
  end
  context 'ユーザー情報を保存できず、次のページへ進めない時' do
    it '誤った情報ではユーザー情報を保存できずにユーザー情報入力ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: ''
      select '--', from: 'user[gender_id]'
      select '--', from: 'user[birth_day(1i)]'
      select '--', from: 'user[birth_day(2i)]'
      select '--', from: 'user[birth_day(3i)]'
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      # 「次へ進む」ボタンを押しても新規登録ページへ戻されることを確認する
      click_on ('次へ進む')
      # ユーザー新規登録2ページ目の「登録する」ボタンが表示されていないことを確認する
      expect(page).to have_no_content('登録する')
    end
  end
end