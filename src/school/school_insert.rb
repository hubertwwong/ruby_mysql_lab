require "mysql2"

class SchoolInsert

  # connection credentials.
  def connect
    client = Mysql2::Client.new(:host => "localhost", 
                                :database => "school",
                                :username => "root", 
                                :password => "password")
  end  

  # simple connection test..
  def self.test1
    client = self.connect
    results = client.query("SELECT * FROM class")
    return results
  end
  
end

# hello.db
#
# has a db called hello
# has a table greeting
# has 2 table values id name