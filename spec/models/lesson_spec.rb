require "rails_helper"


describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
end
