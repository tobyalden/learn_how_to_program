class Lesson < ActiveRecord::Base
  before_save :set_number
  validates :name, :presence => true
  validates :content, :presence => true

  def next
    return Lesson.where("number > #{number}").order("number").first
  end

  def previous
    return Lesson.where("number < #{number}").order("number DESC").first
  end

  # def next
  #   all = Lesson.all
  #   all = all.sort_by {|lesson| lesson.number}
  #   if all.index(self) < all.length - 1
  #     return all[all.index(self) + 1]
  #   end
  # end

  private
  def set_number
    max = Lesson.maximum("number")
    if max
      self.number = max + 1
    else
      self.number = 1
    end
    true
  end

end
