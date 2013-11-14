require_relative "../../../src/school/school_query"

describe SchoolQuery do
  
  describe "query" do
    before(:each) do
      @sq = SchoolQuery.new
    end
    
    describe "is_person_a_teacher?" do
      before(:each) do
        @sq = SchoolQuery.new
      end
      
      it "110 should return true" do
        person_id = 110  
        expect(@sq.is_person_a_teacher?(person_id)).to eq(true)
      end
      
      it "20 should return true" do
        person_id = 20  
        expect(@sq.is_person_a_teacher?(person_id)).to eq(true)
      end
    end
  end
  
end