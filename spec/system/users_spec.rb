require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができて且つ、トップページへ遷移する' do
      # 新規登録ページへ遷移する
      access_sign_up_page(@user)
      # ユーザー情報を入力し、アンケート内容入力ページへ遷移する
      input_user_info(@user)
      # アンケート内容を入力する
      select '漫画', from: 'questionnaire[category_id]'
      select 'ファンタジー', from: 'questionnaire[genre_id]'
      select '書店', from: 'questionnaire[purchase_place_id]'
      select '紙媒体', from: 'questionnaire[reading_media_id]'
      # 「登録する」ボタンを押すとUserモデルとQuestionnaireモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { User.count && Questionnaire.count }.by(1)
      # ユーザー新規登録2ページ目の「登録する」ボタンが表示されていないことを確認する
      expect(page).to have_no_content('登録する')
      # 「トップページへ」ボタンを押すとトップページへ遷移する
      click_on('トップページへ')
      expect(current_path).to eq(root_path)
      # トップページに「新規登録」ボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      # トップページにユーザー名が表示されていることを確認する
      expect(page).to have_content(@user.nickname)
    end
  end

  context 'ユーザー情報を保存できず且つ、次のページへ進めない時' do
    it '誤った情報ではユーザー情報を保存できずにユーザー情報入力ページへ戻ってくる' do
      access_sign_up_page(@user)
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
      click_on('次へ進む')
      expect(current_path).to eq(user_registration_path)
      # エラーメッセージが表示されていることを確認する
      expect(page).to have_css '.field_with_errors'
      # ユーザー新規登録2ページ目の「登録する」ボタンが表示されていないことを確認する
      expect(page).to have_no_content('登録する')
    end
  end

  context 'アンケート内容を保存できず且つ、次のページへ進めない時' do
    it '誤った情報ではアンケート内容を保存できずにアンケート内容入力ページへ戻ってくる' do
      # 新規登録ページへ遷移する
      access_sign_up_page(@user)
      # ユーザー情報を入力し、アンケート内容入力ページへ移動する
      input_user_info(@user)
      # アンケート内容を入力する
      select '--', from: 'questionnaire[category_id]'
      select '--', from: 'questionnaire[genre_id]'
      select '--', from: 'questionnaire[purchase_place_id]'
      select '--', from: 'questionnaire[reading_media_id]'
      # 「登録する」ボタンを押してもUserモデルとQuestionnaireモデルのカウントは上がらないことを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { User.count && Questionnaire.count }.by(0)
      # アンケート入力ページへ戻されることを確認する
      expect(current_path).to eq questionnaires_path
      # エラーメッセージが表示されていることを確認する
      expect(page).to have_css '.field_with_errors'
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
      # ログインページへ移動する
      access_sign_in_page(@user)
      # 正しい情報を入力してログインする
      sign_in(@user)
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # ログインページへ移動する
      access_sign_in_page(@user)
      # ユーザー情報を入力する
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      # ログインボタンを押す
      click_on('ログイン')
      # ログインボタンを押してもログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'ユーザー情報詳細（マイページ）', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @questionnaire = FactoryBot.create(:questionnaire)
    @book = FactoryBot.create(:book, user_id: @user.id)
  end
  
  context 'マイページへ遷移できる時' do
    it 'ログインしているユーザーはマイページへ遷移でき、ユーザー情報を閲覧できる' do
      # ログインする
      sign_in(@user)
      # トップページにユーザー名が表示されていることを確認する
      expect(page).to have_content(@user.nickname)
      # ユーザー名をクリックするとマイページへ遷移することを確認する
      click_on(@user.nickname)
      expect(current_path).to eq(user_path(@user.id))
      # マイページにはユーザー情報が存在することを確認する
      expect(page).to have_content(@user.nickname && @user.gender.name && @user.birth_day && @user.email)
      # マイページにはアンケート情報が存在することを確認する
      expect(page).to have_content(@questionnaire.category.name && @questionnaire.genre.name && @questionnaire.purchase_place.name && @questionnaire.reading_media.name)
      # マイページには投稿した内容が存在することを確認する（画像、投稿時刻）
      expect(page).to have_selector("img[src$='test_image.png']" && ".book-posted-time")
      # マイページには投稿した内容が存在することを確認する（タイトル）
      expect(page).to have_content(@book.title)
    end
  end

  context 'マイページへ遷移できない時' do
    it 'ログインしていないユーザーはマイページへ遷移できない' do
      visit root_path
      # トップページにユーザー名が表示されていないことを確認する
      expect(page).to have_no_content(".user-nickname")
    end
  end
end