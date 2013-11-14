require "mysql2"

class SchoolQuery

  # checks if a person_id in the person table is a teacher.
  # returns true / false.
  def is_person_a_teacher? (person_id)
    client = self.connect
    
    # escaping... you don't have do it for single quotes inside double quotes.
    db_sql = "SELECT * " +
                "FROM person p " +
                "INNER JOIN role r ON r.id = p.role_id " +
                "WHERE r.name='teacher'" +
                  "AND p.id=" + person_id.to_s + ";"
                #"WHERE r.name=\'teacher\' " +
                #  "AND p.id = " + person_id.to_s + ";"
    # puts db_sql
    result = client.query(db_sql)
    
    if result.count > 0
      return true
    else
      return false
    end
    #puts result.count.to_s
    #puts result
    #puts "done...."
  end



  # DB CREDENTIALS
  ############################################################################
  
  # connection credentials.
  def connect
    client = Mysql2::Client.new(:host => "localhost", 
                                :database => "school",
                                :username => "root", 
                                :password => "password")
  end  

  def connect_without_db
    client = Mysql2::Client.new(:host => "localhost", 
                                :username => "root", 
                                :password => "password")
  end

end