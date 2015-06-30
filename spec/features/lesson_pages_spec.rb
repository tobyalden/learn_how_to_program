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
