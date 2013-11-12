require_relative "../../../src/school/school_insert"

describe SchoolInsert do
  
  describe "create" do
    before(:each) do
      @si = SchoolInsert.new
    end
    
    describe "db" do
      describe "create" do
        xit "should create db" do
          expect(@si.create_db).to eq(true)
        end
      end
      
      describe "insert table" do
        xit "should create tables" do
          expect(@si.create_tables).to eq(true)
        end
      end
    end
  end
  
end