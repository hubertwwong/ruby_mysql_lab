require_relative "../../../src/school/school_insert"

describe SchoolInsert do
  
  describe "insert" do
    before(:each) do
      @si = SchoolInsert.new
      @client = @si.connect
    end
    
    it "should return true" do
      @client.should == "world"
    end
  end
  
end