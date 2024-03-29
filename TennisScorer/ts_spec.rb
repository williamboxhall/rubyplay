require "./tennis_scorer"

describe TennisScorer, "score" do
  before(:each) do
    @ts = TennisScorer.new
  end

  it "should start with a score of 0-0" do
    @ts.score.should == "0-0"
  end

  it "should be 15-0 if the server wins a point" do
    @ts.give_point_to(:server)
    @ts.score.should == "15-0"
  end

  it "should be 0-15 if the receiver wins a point" do
    @ts.give_point_to(:receiver)
    @ts.score.should == "0-15"
  end

  it "should be 15-15 after they both win a point" do
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:server)
    @ts.score.should == "15-15"
  end

  it "should be 30-0 when the server wins two points" do
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.score.should == "30-0"
  end

  it "should be 40-0 after the server wins three points" do
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.score.should == "40-0"
  end

  it "should be W-L after the server wins four points" do
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.score.should == "W-L"
  end

  it "should be L-W after the receiver wins four points" do
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.score.should == "L-W"
  end

  it "should be Deuce after each wins three points" do
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.score.should == "Deuce"
  end

  it "should be A-server after each wins three points and the server gets one more" do
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:server)
    @ts.score.should == "A-server"
  end

  it "should be A-receiver after each wins three points and the receiver gets one more" do
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:server)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.give_point_to(:receiver)
    @ts.score.should == "A-receiver"
  end

  it "should be Deuce again at 5-5"

  it "should be A-server again at 6-5"

  it "should be A-receiver again at 5-6"

  it "should be W-L at 7-5"

  it "should be L-W at 5-7"
end





