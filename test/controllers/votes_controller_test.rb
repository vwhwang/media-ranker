require "test_helper"

describe VotesController do
  it "must post upvote" do
    login()
    work = works(:poodr)

    post work_upvote_path(work.id)

    expect(work.votes.count).must_equal 1
  end

end
