require 'rails_helper'

RSpec.describe "AdminLogins", type: :system do



  include LoginMacros

  # let!(:user) { create(:user) }
  let(:user) { create(:user, name: 'admin', password: 'password', password_confirmation: 'password') }

  
  context 'ログイン前' do
    describe '正しいユーザー名・パスワードを入力' do 
      it '正常にログインできる' do
        login(user)
        
        expect(current_path).to eq admin_dashboard_path
        expect(page).to have_content 'Blog'
      end
    end
  end

  # before do
  #   driven_by(:rack_test)
  # end

  # pending "add some scenarios (or delete) #{__FILE__}"
end
