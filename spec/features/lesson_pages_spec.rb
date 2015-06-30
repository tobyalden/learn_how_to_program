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

describe "the process of editing a lesson" do
  it "edits lesson information" do
    test_lesson = Lesson.create(:name => "Ember.js", :content => "If I see that damn hamster one more time");
    visit lesson_path(test_lesson)
    click_on "Edit"
    fill_in "Content", :with => "If I see that damn gopher one more time"
    click_on "Update Lesson"
    expect(page).to have_content "gopher"
  end
end

describe "the process of deleting a lesson" do
  it "deletes a lesson" do
    test_lesson = Lesson.create(:name => "Ember.js", :content => "If I see that damn hamster one more time");
    visit lesson_path(test_lesson)
    click_on "Delete"
    expect(page).to have_no_content "Ember.js"
  end
end
