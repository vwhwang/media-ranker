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

    describe "top logics " do 
      it "top_work will create one top work" do 
        top_work = Work.top_work
        expect(top_work.title).must_equal "Kindred" 
      end 

      it "top_10 will create 3 top work by category" do 
        top_work = Work.top_10("book")
        expect(top_work.count).must_equal 3
      end 

    end 
  end 

  describe 'relations' do 
    describe 'vote' do 
      it "can have many votes" do
        new_work = Work.create(title:"test new work")
        user = users(:oscar)
        expect(new_work.votes.count).must_equal 0 

        vote1 = Vote.create(work:new_work, user:user)
        vote2 = Vote.create(work:new_work, user:user)

        expect(new_work.votes.count).must_equal 2
      end 
    end 
  end 
end
