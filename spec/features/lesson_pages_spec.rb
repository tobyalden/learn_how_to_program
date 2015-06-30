require "rails_helper"

describe "the add a lesson process" do
  it "adds a new lesson" do
    visit lessons_path
    click_on "Add lesson"
    fill_in 'Name', :with => "Ember"
    fill_in 'Content', :with => "Watch some videos"
    click_on 'Create Lesson'
    expect(page).to have_content "Ember"
  end
end

describe "the view a lesson process" do
  it "displays lesson information" do
    test_lesson = Lesson.create(:name => "Ember.js", :content => "If I see that damn hamster and/or gopher one more time");
    visit lessons_path
    click_on test_lesson.name
    expect(page).to have_content "gopher"
  end
end
