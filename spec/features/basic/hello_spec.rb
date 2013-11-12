require_relative "../../../src/basic/hello"

describe Hello do
  
  describe "hello" do
    it "should return true" do
      Hello.hello.should == "world"
    end
  end
  
  describe "db" do
    it "test1" do
      Hello.test1.should == "world"
    end
  end
  
end
