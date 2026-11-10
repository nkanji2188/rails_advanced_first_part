require 'rails_helper'

RSpec.describe "AdminArticlesPreviewsSpecs", type: :system do

  include LoginMacros

    
  let(:user) { create(:user, name: 'admin', password: 'password', password_confirmation: 'password', role: "admin",) }

  before { login(user) }

  context 'ログイン後' do
    describe '記事作成画面で画像ブロックを追加' do 
      context '画像を添付せずにプレビューを閲覧' do
        it '正常に表示される' do
          visit admin_dashboard_path
          click_on '記事'
          click_on '新規作成'
          fill_in 'タイトル', with: 'テストタイトル '
          fill_in 'スラッグ', with: 'testslag'
          fill_in '概要', with: 'test'
          click_on '登録する'
          
          article = Article.last
          
          expect(page).to have_content 'ブロックを追加する'
          
          expect(current_path).to eq edit_admin_article_path(article.uuid)
          
          click_on 'ブロックを追加する'
          click_on '画像'
          expect(page).to have_content 'メディア'
          click_on 'プレビュー'
          switch_to_window(windows.last)
          expect(current_path).to eq admin_article_preview_path(article.uuid)
          expect(page).to have_content 'Very awesome!'
      
        end
      
      end
    end
  end

  # before do
  #   driven_by(:rack_test)
  # end
  # pending "add some scenarios (or delete) #{__FILE__}"
end
