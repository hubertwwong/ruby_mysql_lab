require_relative "../../../src/school/school_create"

describe SchoolCreate do
  
  describe "create" do
    before(:each) do
      @si = SchoolCreate.new
    end
    
    describe "struct" do
      describe "db" do
        xit "should create db" do
          expect(@si.create_db).to eq(true)
        end
      end
      
      describe "table" do
        xit "should create tables" do
          expect(@si.create_tables).to eq(true)
        end
      end
    end
  end
  
end