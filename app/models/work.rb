class Work < ApplicationRecord
  has_many :votes
  validates :title , presence: true , uniqueness:true 

  def self.top_work
    @top_work = Work.all[0]
    return @top_work 
  end 

  def self.top_10(category)
    @works = Work.where(category: category)
    return  @works.sample(3)
  end 

end


