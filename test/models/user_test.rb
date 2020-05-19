require "test_helper"

describe User do

  describe "validations" do 

    before do 
      @user = User.new(username: 'testing new user')
    end 

    it "is valid when username is present" do 
      result = @user.valid? 

      expect(result).must_equal true 

    end 

    it "will not create user if username is nil" do 
      @user.username = nil 
      result = @user.valid?

      expect(result).must_equal false 
      expect(@user.errors).wont_be_empty  
      expect(@user.errors.messages[:username].include?("can't be blank") ).must_equal true 
    end 

    it "will not create work if already exist " do 
      user = users(:oscar)

      new_user = User.create(username: user.username)
      result = new_user.valid? 

      expect(result).must_equal false 
      expect(new_user.errors.messages[:username].include?("has already been taken")).must_equal true 

    end 
  end 


  describe 'relations' do 

    describe 'vote' do 
      it "can have many votes" do
        new_user = User.create(username:"bob")
        work1 = works(:kindred)
        work2 = works(:parable)

        expect(new_user.votes.count).must_equal 0 

        vote1 = Vote.create(work:work1, user:new_user)
        vote2 = Vote.create(work:work2, user:new_user)

        expect(new_user.votes.count).must_equal 2
      end 


      it "same user cannot vote for the same work when already voted" do
        new_user = User.create(username:"bob")
        work = works(:kindred)
        
        expect(new_user.votes.count).must_equal 0 

        vote1 = Vote.create(work:work, user:new_user)
        expect(new_user.votes.count).must_equal 1
        vote2 = Vote.create(work:work, user:new_user)

        expect(new_user.votes.count).must_equal 1
      end 
    end 

  end 

end
