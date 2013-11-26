require "rubygems"
require "sequel"
require "mysql2"
require 'benchmark'
require 'bigdecimal/math'

class SpaceShipInsertSequel

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
    
    client.run(db_str)
    client.disconnect
    
    puts "foo bar inserted"
    
    return true
  end

  # naive implementation
  # 1000 for about 7 vs. 5 seconds on a raw db
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
      client.run(db_str)  
    end
    
    client.disconnect
    
    puts "foo bar inserted"
    
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
  # 1000 for about 3 seconds..
  # seems like you getting a 2x performance increase... but 6x worse..
  # transctions.
  def transaction_insert(num_times)
    client = self.connect
    r = Random.new
    
    # transaction start..
    client.run "START TRANSACTION"
    
    # insert test..
    1.upto(num_times) do |i|
      db_str = "INSERT INTO fleet (name, description) " +
                              "VALUES (" +
                              "'foo" + r.rand(100).to_s + "', " +
                              "'bar' " +
                            ");"
      #puts db_str   
      client.run db_str  
    end
    
    # transaction start..
    client.run "COMMIT"
    
    # cleanup
    puts "insertion complete"
    client.disconnect
    
    return true
  end
  
  def bench_transaction(num_times)
    Benchmark.bm do |bm|
      bm.report do
        self.transaction_insert(num_times)    
      end
    end      
  end


  # transaction 2 implementation
  # more sequelish transaction.
  # transctions.
  def transaction2_insert(num_times)
    client = self.connect
    dataset = client[:fleet]
    r = Random.new
    
    # transaction start..
    client.transaction do
    
      # insert test..
      1.upto(num_times) do |i|
        dataset.insert(:name => 'foo' + r.rand(100).to_s,
                       :description => 'bar')  
      end
    
    # transaction end
    end
    
    # cleanup
    puts "insertion complete"
    client.disconnect
    
    return true
  end
  
  def bench_transaction2(num_times)
    Benchmark.bm do |bm|
      bm.report do
        self.transaction2_insert(num_times)    
      end
    end      
  end




  # DB CREDENTIALS
  ############################################################################
  
  # connection credentials.
  def connect
    db = Sequel.connect(:adapter => 'mysql',
                        :host => 'localhost', 
                        :user => 'root', 
                        :password => 'password',
                        :database => 'space_ship')
    
    
    #client = Mysql2::Client.new(:host => "localhost", 
    #                            :database => "space_ship",
    #                            :username => "root", 
    #                            :password => "password")
  end  

  def connect_without_db
    db = Sequel.connect(:adapter =>'mysql',
                        :host => 'localhost',
                        :user=>'root', 
                        :password=>'password')
    
    #client = Mysql2::Client.new(:host => "localhost", 
    #                            :username => "root", 
    #                            :password => "password")
  end
  
end