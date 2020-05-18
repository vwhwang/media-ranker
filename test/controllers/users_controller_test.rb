require "test_helper"

describe UsersController do


  it "can get user_form" do 
    get login_path

    must_respond_with :success 

  end 

  describe "logging in" do 
    it "can log in a new user " do 
      user = nil 

      expect {
        user = login()
      }.must_differ "User.count", 1 

      expect(user).wont_be_nil
      expect(session[:user_id]).must_equal user.id
      expect(user.username).must_equal "BTS"
        
    end 

    it "can log in an existing user" do 
      user = User.create(username: "oscar the cat")

      expect{
        login(user.username)
      }.wont_change "User.count"

      expect(session[:user_id]).must_equal user.id
    end 

  end 

  describe "logout" do 
    it "can logout " do 
      
      login()
      expect(session[:user_id]).wont_be_nil

      post logout_path

      expect(session[:user_id]).must_be_nil

    end 
  end 


end
