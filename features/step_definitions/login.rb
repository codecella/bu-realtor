Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
   User.create(id: user["id"], email: user["email"])
  end
end
   
Given /^I am signed in with provider "(.*)"$/ do |provider|
  welcome_login_path
  click_link("/auth/github")
end
