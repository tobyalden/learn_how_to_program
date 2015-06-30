require "rails_helper"

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }

  describe "#next" do
    current_lesson = Lesson.create(name: 'lesson1', content: 'content1', number: 1)
    next_lesson = Lesson.create(name: 'lesson2', content: 'content2', number: 3)
    it "returns the lesson with the next-highest number" do
      expect(current_lesson.next).to eq next_lesson
    end
    it "return nil if no next lesson exists" do
      expect(next_lesson.next).to eq nil
    end
  end

end
