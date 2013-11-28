require "mysql2"
require 'benchmark'
require 'bigdecimal/math'

class SpaceShipInsert

  # DB INSERT
  ############################################################################
  
  # basic naive insert into db.
  def basic_insert
    client = self.connect
    
    # create db strings
    
    # class descriptions. english. matth. etc...
    db_str = "INSERT INTO fleet (name, description) " +
                        "VALUES (" +
                        "'foo', " +
                        "'bar' " +
                      ");"
    
    client.query(db_str)
    client.close
    
    puts "foo bar inserted"
    
    return true
  end






  # naive implementation
  # 1000 for about 5 seconds..
  def naive_insert(num_times)
    client = self.connect
    r = Random.new
    
    # insert test..
    1.upto(num_times) do |i|
      db_str = "INSERT INTO fleet (name, description) " +
                              "VALUES (" +
                              "'foo" + r.rand(100).to_s + "', " +
                              "'bar' " +
                            ");"
      #puts db_str   
      client.query(db_str)  
    end
    
    client.close
    
    puts "naive insertion complete"
    
    return true
  end
  
  def bench_naive(num_times)
    Benchmark.bm do |bm|
      bm.report do
        self.naive_insert(num_times)    
      end
    end      
  end






  # transaction implementation
  # 1000 for about 1 seconds..
  # seems like you getting a 4-6x performance increase...
  # transctions.
  def transaction_insert(num_times)
    client = self.connect
    r = Random.new
    
    # transaction start..
    client.query "START TRANSACTION"
    
    # insert test..
    1.upto(num_times) do |i|
      db_str = "INSERT INTO fleet (name, description) " +
                              "VALUES (" +
                              "'foo" + r.rand(100).to_s + "', " +
                              "'bar' " +
                            ");"
      #puts db_str   
      client.query(db_str)  
    end
    
    # transaction start..
    client.query "COMMIT"
    
    # cleanup
    puts "transaction insertion complete"
    client.close
    
    return true
  end
  
  def bench_transaction(num_times)
    Benchmark.bm do |bm|
      bm.report do
        self.transaction_insert(num_times)    
      end
    end      
  end



  # 20x from the transaction....
  # much faster...
  def csv_insert
    client = self.connect
    r = Random.new
    
    # (name, description)
    # /home/user/Dropbox/code/main/ruby/ruby_mysql_lab/src/space_ship
    # note column list at the end....
    db_str = "LOAD DATA INFILE '/home/user/fleet.csv' " +
                              "INTO TABLE fleet " +
                              "FIELDS TERMINATED BY '\t' " +
                              "IGNORE 1 LINES " +
                              "(@dummy, name, description);"
                              
    puts db_str                          
    client.query(db_str)  
    

    # cleanup
    puts "insertion csv complete"
    client.close
    
    return true
  end

  def bench_csv
    Benchmark.bm do |bm|
      bm.report do
        self.csv_insert    
      end
    end      
  end




  # DB CREDENTIALS
  ############################################################################
  
  # connection credentials.
  def connect
    client = Mysql2::Client.new(:host => "localhost", 
                                :database => "space_ship",
                                :username => "root", 
                                :password => "password")
  end  

  def connect_without_db
    client = Mysql2::Client.new(:host => "localhost", 
                                :username => "root", 
                                :password => "password")
  end
  
end