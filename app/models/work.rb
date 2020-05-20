class Work < ApplicationRecord
  has_many :votes
  validates :title , presence: true , uniqueness:true 

  def self.top_work
    @top_work = Work.all.sort_by{|work| -(work.votes.count)}
    return @top_work[0] 
  end 

  def self.top_10(category)
    @works = Work.where(category: category)
    @top_10 = @works.sort_by{|work| [-(work.votes.count),work.title]}
    
    return  @top_10[0..9]
  end 

end


