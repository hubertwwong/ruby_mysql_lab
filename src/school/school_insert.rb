require "mysql2"

class SchoolInsert
  
  # DB insert
  ############################################################################
  
  # insert roles. student teacher.
  def insert_roles
    client = self.connect
    
    db_str = "INSERT INTO role (name) VALUES (\"student\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO role (name) VALUES (\"teacher\");"
    result = client.query(db_str)
    
    return true
  end
  
  # fix the role thing.
  # don't hard code the ids.
  def insert_users
    first_names_f = ["Mary", "Jen", "Mia", "Amy", "Christine", "Andrea", 
                      "Rose", "Sophia", "Emma", "Olivia", "Ava", "Emily", 
                      "Madison", "Chloe", "Lily", "Natalie", "Zoe", "Grace"]
    first_names_m = ["John", "Jack", "Mike", "Tim", "Terry", "George", "Alex",
                      "James", "Robert", "David", "Paul", "Mark", "Donald",
                      "Kenneth", "Edward", "Kevin", "Scott", "Jerry"]
    last_names = ["Smith", "Johnson", "Wilson", "Jones", "Brown", "Davis", 
                    "Miller", "Wilson", "Anderson", "Moore", "Parker", "Evans",
                    "Edwards", "Collins", "Stewart", "Morris", "Rogers", "Reed"]
    
    db_prefix = "INSERT INTO person " +
                  "(first_name, last_name, role_id, gender) " +
                  "VALUES "
    
    # db stuff
    client = self.connect
                      
    # female students.
    100.times do
      final_str = ""
    
      index = Random.rand(first_names_f.size)
      index2 = Random.rand(last_names.size)
      
      # variables to write
      first_name = first_names_f[index]
      last_name = last_names[index2]
      role_id = 1
      gender = "female" 
      
      # values string
      final_str = db_prefix + "(" + 
                              "\"" + first_name + "\", " +
                              "\"" + last_name + "\", " +
                              "" + role_id.to_s + ", " +
                              "\"" + gender + "\"" +
                              ");"
      puts final_str
      client.query(final_str)
    end
    
    # male students.
    100.times do
      final_str = ""
    
      index = Random.rand(first_names_m.size)
      index2 = Random.rand(last_names.size)
      
      # variables to write
      first_name = first_names_m[index]
      last_name = last_names[index2]
      role_id = 1
      gender = "male" 
      
      # values string
      final_str = db_prefix + "(" + 
                              "\"" + first_name + "\", " +
                              "\"" + last_name + "\", " +
                              "" + role_id.to_s + ", " +
                              "\"" + gender + "\"" +
                              ");"
      puts final_str
      client.query(final_str)
    end
    
    # female teachers.
    10.times do
      final_str = ""
    
      index = Random.rand(first_names_f.size)
      index2 = Random.rand(last_names.size)
      
      # variables to write
      first_name = first_names_f[index]
      last_name = last_names[index2]
      role_id = 2
      gender = "female" 
      
      # values string
      final_str = db_prefix + "(" + 
                              "\"" + first_name + "\", " +
                              "\"" + last_name + "\", " +
                              "" + role_id.to_s + ", " +
                              "\"" + gender + "\"" +
                              ");"
      puts final_str
      client.query(final_str)
    end
    
    # male teachers.
    10.times do
      final_str = ""
    
      index = Random.rand(first_names_m.size)
      index2 = Random.rand(last_names.size)
      
      # variables to write
      first_name = first_names_m[index]
      last_name = last_names[index2]
      role_id = 2
      gender = "male" 
      
      # values string
      final_str = db_prefix + "(" + 
                              "\"" + first_name + "\", " +
                              "\"" + last_name + "\", " +
                              "" + role_id.to_s + ", " +
                              "\"" + gender + "\"" +
                              ");"
      puts final_str
      client.query(final_str)
    end
    
    return true    
  end

  # insert subjects.
  def insert_subjects
    client = self.connect
    
    db_str = "INSERT INTO subject (name) VALUES (\"english\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"math\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"history\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"gelogy\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"chemistry\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"biology\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"physics\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"PE\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"psychology\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"economics\");"
    result = client.query(db_str)
    
    db_str = "INSERT INTO subject (name) VALUES (\"under water basket weaving\");"
    result = client.query(db_str)
    
    return true
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