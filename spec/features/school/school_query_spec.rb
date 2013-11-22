require_relative "../../../src/school/school_query"

describe SchoolQuery do
  
  describe "count" do
    before(:each) do
      @sq = SchoolQuery.new
    end
    
    describe "count_x" do
      before(:each) do
        @sq = SchoolQuery.new
      end
      
      it "period should return > 0" do
        expect(@sq.count_table("period")).to be > 1
      end
    end
  end
  
  describe "query" do
    before(:each) do
      @sq = SchoolQuery.new
    end
    
    describe "is_person_taking_a_class?" do
      before(:each) do
        @sq = SchoolQuery.new
      end
      
      it "110 should return false" do
        person_id = 110
        schedule_id = 10
        expect(@sq.is_person_taking_a_class?(person_id, schedule_id)).to eq(false)
      end
      
      # assumes you put this into the db...
      it "1 and 1 should return false" do
        person_id = 1
        schedule_id = 1
        expect(@sq.is_person_taking_a_class?(person_id, schedule_id)).to eq(true)
      end
    end
    
    describe "is_person_a_teacher?" do
      before(:each) do
        @sq = SchoolQuery.new
      end
      
      it "110 should return false" do
        person_id = 110  
        expect(@sq.is_person_a_teacher?(person_id)).to eq(false)
      end
      
      it "20 should return false" do
        person_id = 20
        expect(@sq.is_person_a_teacher?(person_id)).to eq(false)
      end
    end
    
    describe "is_person_a_student?" do
      before(:each) do
        @sq = SchoolQuery.new
      end
      
      it "100 should return true" do
        person_id = 100
        expect(@sq.is_person_a_student?(person_id)).to eq(true)
      end
      
      it "201 should return false" do
        person_id = 201 
        expect(@sq.is_person_a_student?(person_id)).to eq(false)
      end
    end
  end
  
end