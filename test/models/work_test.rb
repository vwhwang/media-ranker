require "test_helper"

describe Work do

  describe "validations" do 
    before do 
      @work = Work.new(title: 'test work title')
    end 

    it "is valid when title is present" do 
      result = @work.valid? 

      expect(result).must_equal true 

    end 

    it "will not create work if title is nil" do 
      @work.title = nil 
      result = @work.valid?

      expect(result).must_equal false 
      expect(@work.errors).wont_be_empty  
      expect(@work.errors.messages[:title].include?("can't be blank") ).must_equal true 
    end 

    it "will not create work if already exist " do 
      work = works(:kindred)

      new_work = Work.create(title: work.title)
      result = new_work.valid? 

      expect(result).must_equal false 
      expect(new_work.errors.messages[:title].include?("has already been taken")).must_equal true 

    end 

  end 
end
