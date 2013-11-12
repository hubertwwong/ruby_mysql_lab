require_relative "../../../src/basic/hello"

describe Hello do
  
  describe "hello" do
    it "should return true" do
      expect(Hello.hello).to eq("world")
    end
  end
  
  describe "db" do
    it "test1" do
      expect(Hello.test1).to eq(true)
    end
  end
  
end
