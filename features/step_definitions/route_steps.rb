Given /^I have no routes$/ do
  Route.delete_all
end

Given /^I (only )?have routes titled "?([^\"]*)"?$/ do |only, titles|
  Route.delete_all if only
  titles.split(', ').each do |title|
    Route.create(:url => title)
  end
end

Then /^I should have ([0-9]+) routes?$/ do |count|
  Route.count.should == count.to_i
end
