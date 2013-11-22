require "mysql2"

class SchoolQuery

  # checks if a person is in the class..
  # just uses id.
  def is_person_taking_a_class? (person_id, schedule_id)
    client = self.connect
    
    # escaping... you don't have do it for single quotes inside double quotes.
    db_sql = "SELECT * " +
                "FROM student_schedule ss " +
                "WHERE ss.person_id=" + person_id.to_s + " " +
                  "AND ss.schedule_id=" + schedule_id.to_s + ";"
                #"WHERE r.name=\'teacher\' " +
                #  "AND p.id = " + person_id.to_s + ";"
    # puts db_sql
    result = client.query(db_sql)
    
    # close sql client.
    # might need to do this to allow more connections.
    client.close
    
    if result.count > 0
      return true
    else
      return false
    end
    
  end

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
    
    # close sql client.
    # might need to do this to allow more connections.
    client.close
    
    if result.count > 0
      return true
    else
      return false
    end
    
    #puts result.count.to_s
    #puts result
    #puts "done...."
  end

  # checks if a person_id in the person table is a student.
  # returns true / false.
  def is_person_a_student? (person_id)
    client = self.connect
    
    # escaping... you don't have do it for single quotes inside double quotes.
    db_sql = "SELECT * " +
                "FROM person p " +
                "INNER JOIN role r ON r.id = p.role_id " +
                "WHERE r.name='student'" +
                  "AND p.id=" + person_id.to_s + ";"
                #"WHERE r.name=\'teacher\' " +
                #  "AND p.id = " + person_id.to_s + ";"
    # puts db_sql
    result = client.query(db_sql)
    
    # close sql client.
    # might need to do this to allow more connections.
    client.close
    
    if result.count > 0
      return true
    else
      return false
    end
    
    #puts result.count.to_s
    #puts result
    #puts "done...."
  end


  # COUNT QUERIES...
  ############################################################################
  
  # a simple function that counts the number of rows of a table.
  def count_table(table_name)
    client = self.connect
    period_count = -1
    
    # figure out number of periods in the db.
    # assume the index is 1-n
    db_str = "SELECT COUNT(*) FROM " + table_name
    client.query(db_str).each do |row|
      period_count = row["COUNT(*)"]
    end
    
    # close connection
    client.close
    
    return period_count
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