require_relative "../../../src/school/school_insert"

describe SchoolInsert do
  
  describe "insert" do
    before(:each) do
      @si = SchoolInsert.new
    end
    
    describe "roles" do
      before(:each) do
        @si = SchoolInsert.new
      end
      
      xit "should return true" do
        expect(@si.insert_roles).to eq(true)
      end
    end
    
    describe "persons" do
      before(:each) do
        @si = SchoolInsert.new
      end
      
      xit "should return true" do
        expect(@si.insert_users).to eq(true)
      end
    end
    
    describe "subjects" do
      before(:each) do
        @si = SchoolInsert.new
      end
      
      xit "should return true" do
        expect(@si.insert_subjects).to eq(true)
      end
    end
  end
  
end