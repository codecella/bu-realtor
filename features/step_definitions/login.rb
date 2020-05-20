Given /the following users exist/ do |user_table|
  user_table.hashes.each do |user|
   User.create(id: user["id"], email: user["email"])
  end
end

Given (/the following authorizations exist/) do |authorizations_table|
  authorizations_table.hashes.each do |authorization|
    Authorization.create!(authorization) 
  end
end
   
Given /^I am signed in with provider "(.*)"$/ do |provider|
  visit "/auth/github"
end

# Then /^(?:|I )press "([^"]*)$/ do |update|
#   click_button(update)
# end