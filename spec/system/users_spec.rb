require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができる時' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
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
      select '漫画', from: 'questionnaire[book_category_id]'
      select 'ファンタジー', from: 'questionnaire[book_genre_id]'
      select '書店', from: 'questionnaire[purchase_place_id]'
      select '紙媒体', from: 'questionnaire[reading_type_id]'
      # 「登録する」ボタンを押すと登録完了ページへ移動する
      click_on ('登録する')
      # ユーザー新規登録2ページ目の「登録する」ボタンが表示されていないことを確認する
      expect(page).to have_no_content('登録する')
      # 「トップページへ」ボタンを押すとトップページへ移動する
      click_on('トップページへ')
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページに「新規登録」ボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
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
  context 'アンケート内容を保存できず、次のページへ進めない時' do
    it '誤った情報ではアンケート内容を保存できずにアンケート内容入力ページへ戻ってくる' do
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
      select '--', from: 'questionnaire[book_category_id]'
      select '--', from: 'questionnaire[book_genre_id]'
      select '--', from: 'questionnaire[purchase_place_id]'
      select '--', from: 'questionnaire[reading_type_id]'
      # 「登録する」ボタンを押してもアンケート内容入力ページへ戻されることを確認する
      click_on ('登録する')
      # ユーザー新規登録3ページ目の「トップページへ」ボタンが表示されていないことを確認する
      expect(page).to have_no_content('トップページへ')
    end
  end  
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      # ログインボタンを押す
      click_on('ログイン')
      # トップページへ遷移することを確認する
      expect(current_path).to eq (root_path)
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      # ログインボタンを押す
      click_on('ログイン')
      # ログインボタンを押してもログインページへ戻されることを確認する
      expect(current_path).to eq (new_user_session_path)
    end
  end
end