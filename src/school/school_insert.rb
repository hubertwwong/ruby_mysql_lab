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
  # probably fix this....
  # so ithe subjects are in loops.
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

  # periods
  # using 0000-00-00 for invalid dates
  # generating a set of valid start and end times.
  # ususally schools have a set of schedules that class start and end on.
  #
  # keeping it simple. generate Mon Wed Fri and Tues Thu Sat with times listed.
  def insert_periods
    client = self.connect
    
    start_times = ["0000-00-00 10:00:00", "0000-00-00 14:00:00", "0000-00-00 18:00:00"]
    end_times = ["0000-00-00 11:00:00", "0000-00-00 15:00:00", "0000-00-00 19:00:00"]
    
    # MWF classes.
    start_times.each_with_index do |elem, i|
      db_prefix = "INSERT INTO period (mon_start, mon_end, " +
                                   "wed_start, wed_end, " + 
                                   "fri_start, fri_end) VALUES "
      db_values = "(" +
                    "\"" + start_times[i] + "\", " +
                    "\"" + end_times[i] + "\", " +
                    "\"" + start_times[i] + "\", " +
                    "\"" + end_times[i] + "\", " +
                    "\"" + start_times[i] + "\", " +
                    "\"" + end_times[i] + "\"" +
                  ");"
      final_str = db_prefix + db_values  
      puts final_str           
      client.query(final_str)  
    end
    
    # TWS classes.
    start_times.each_with_index do |elem, i|
      db_prefix = "INSERT INTO period (tue_start, tue_end, " +
                                   "thu_start, thu_end, " + 
                                   "sat_start, sat_end) VALUES "
      db_values = "(" +
                    "\"" + start_times[i] + "\", " +
                    "\"" + end_times[i] + "\", " +
                    "\"" + start_times[i] + "\", " +
                    "\"" + end_times[i] + "\", " +
                    "\"" + start_times[i] + "\", " +
                    "\"" + end_times[i] + "\"" +
                  ");"
      final_str = db_prefix + db_values  
      puts final_str           
      client.query(final_str)  
    end
    
    return true
  end
  
  # insert schedules
  #
  # randomized... assign teachers to classes and periods...
  def insert_schedules
    client = self.connect
    
    # figure out number of periods in the db.
    # assume the index is 1-n
    db_str = "SELECT * FROM period"
    period_count = client.query(db_str).count
    
    # figure out number of subjects in the db.
    # assumes the index is 1-n
    db_str = "SELECT * FROM subject"
    subject_count = client.query(db_str).count
    
    # figure out number of people in the db.
    # when doing the check for random people.
    # you need to check if its a teacher.
    db_str = "SELECT * FROM person"
    people_count = client.query(db_str).count
    
    # 20 classes...
    # create 20 random classes.
    30.times do
      db_prefix = "INSERT INTO schedule (subject_id, person_id, period_id," +
                        "num_seat, num_wait_seat, status) "
      
      cur_subject_id = Random.rand(subject_count) + 1
      cur_period_id = Random.rand(period_count) + 1
      cur_person_id = Random.rand(people_count) + 1
      cur_num_seats = Random.rand(40) + 10
      cur_num_wait_seats = Random.rand(10)
      cur_status = "available"
      
      # construct values.
      db_values = "VALUES (" +
                    "" + cur_subject_id.to_s + ", " +
                    "" + cur_person_id.to_s + ", " +
                    "" + cur_period_id.to_s + ", " +
                    "" + cur_num_seats.to_s + ", " +
                    "" + cur_num_wait_seats.to_s + ", " +
                    "\"" + cur_status + "\"" +
                  ");"
                  
      # construct final sql string
      final_str = db_prefix + db_values
      puts final_str
      
    end
    
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