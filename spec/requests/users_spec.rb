require 'rails_helper'
RSpec.describe UsersController, type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET #show" do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get user_path(@user.id)
    end
  end
end
