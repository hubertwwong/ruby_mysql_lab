require "mysql2"

class Hello
  
  def self.hello
    return "world"
  end
  
  # simple connection test..
  def self.test1
    client = Mysql2::Client.new(:host => "localhost", 
                                :database => "hello",
                                :username => "root", 
                                :password => "password")
    results = client.query("SELECT * FROM greeting")
    return true
  end
  
end

# hello.db
#
# has a db called hello
# has a table greeting
# has 2 table values id name