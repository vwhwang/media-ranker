require "test_helper"

describe Vote do
  describe 'relations' do 
    
    describe 'User' do 

      it "can set up user through user" do 
        user = users(:vicki)
        vote = Vote.new
        
        vote.user = user
        expect(vote.user_id).must_equal user.id
      end 

      it "can set up user via user_id" do 
        user = users(:vicki) 
        vote = Vote.new

        vote.user_id = user.id
        expect(vote.user).must_equal user
        expect(vote.user.username).must_equal user.username
      end 
    end 

    describe 'Work' do 
      it "can set up work through work" do 
        work = works(:kindred)
        vote = Vote.new
        
        vote.work = work
        expect(vote.work_id).must_equal work.id
      end 

      it "can set up work via work_id" do 
        work = works(:kindred)
        vote = Vote.new

        vote.work_id = work.id
        expect(vote.work).must_equal work
        expect(vote.work.title).must_equal work.title
      end 
    
    end 



  end 
end
