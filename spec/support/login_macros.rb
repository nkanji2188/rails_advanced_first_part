module LoginMacros
  def login(user, password = 'password')
    visit admin_login_identifier_path
    fill_in 'user_name', with: user.name
    click_on '次へ'
    fill_in 'user_password', with: password
    click_on 'ログイン'
  end
end