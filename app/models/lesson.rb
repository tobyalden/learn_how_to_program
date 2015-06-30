class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :content, :presence => true

  def next
    return Lesson.where("number > #{number}").order("number").first
  end

  # def next
  #   all = Lesson.all
  #   all = all.sort_by {|lesson| lesson.number}
  #   if all.index(self) < all.length - 1
  #     return all[all.index(self) + 1]
  #   end
  # end

end
