require "rails_helper"

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }

  describe "#next" do
    it "returns the lesson with the next-highest number. returns nil if none exists." do
      current_lesson = Lesson.create(name: 'lesson1', content: 'content1')
      next_lesson = Lesson.create(name: 'lesson2', content: 'content2')
      expect(current_lesson.next).to eq next_lesson
      expect(next_lesson.next).to eq nil
    end
  end

  describe "#previous" do
    it "returns the lesson with the next-lowest number. returns nil if none exists." do
      previous_lesson = Lesson.create(name: 'lesson1', content: 'content1')
      current_lesson = Lesson.create(name: 'lesson2', content: 'content2')
      expect(current_lesson.previous).to eq previous_lesson
      expect(previous_lesson.previous).to eq nil
    end
  end

end
