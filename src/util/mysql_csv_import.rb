require 'mysql2'
require 'pathname'

class MySQLCSVImport
  attr_accessor :url, :user, :password, :db_name
  
  # need to pass all of the db args for the methods to work.
  def initialize(params = {})
    @url = params.fetch(:url)
    @user = params.fetch(:user)
    @password = params.fetch(:password)
    @db_name= params.fetch(:db_name)
    
    # connect to db.      
    @db = Mysql2::Client.new(:host => @url, 
                             :database => @db_name,
                             :username => @user, 
                             :password => @password)
  end
  
  # pass a nil to the param if you don't need it.
  # for terminations characters. use the escape sequence
  # i.e. \t for tabs..
  def import_csv(params = {})
    db_str = self.construct_db_str params
    
    # run the query.
    if db_str != nil || db_str != false
      puts "writing to db."
      @db.query db_str  
    end
    
    puts "write complete."
    @db.close
    
    return true
  end

  # constructs the mysql string to insert the data
  def construct_db_str(params = {})
    filename = params.fetch(:filename)
    table_name = params.fetch(:table_name)
    skip_num_lines = params.fetch(:skip_num_lines)
    term_fields_by = params.fetch(:term_fields_by)
    enclosed_by = params.fetch(:enclosed_by)
    escaped_by = params.fetch(:escaped_by)
    term_line_by = params.fetch(:term_line_by)
    col_names = params.fetch(:col_names)
    
    # INTIAL CHECKS
    
    # check if path exist.
    # if it doesn't exit the path.
    pn = Pathname.new filename
    if pn.exist? == false
      puts "error: csv does not exist."
      return false
    end
    
    if col_names == nil
      puts "error: need to define column names"
      return false
    end
    
    if term_line_by == nil
      puts "error: define line terminator. usually \n or \r\n"
      return false
    end
    
    # construct the db string.
    
    # initial sql statemet
    db_str = "LOAD DATA INFILE '" + filename + 
             "' INTO TABLE " + table_name
    
    # usually csv are terminated by commas
    # but you can use other termination symbols.
    if term_fields_by != nil
      db_str = db_str + " FIELDS TERMINATED BY '" + 
               term_fields_by + "'"
    end
    
    if enclosed_by != nil
      db_str = db_str + " ENCLOSED BY '" + 
               enclosed_by + "'"
    end
    
    if escaped_by != nil
      db_str = db_str + " ESCAPED BY '" + 
               escaped_by + "'"
    end
    
    # windows and unix have different line terminations.
    # you need to specify this.
    if term_line_by != nil
      db_str = db_str + " LINES TERMINATED BY '" + 
               term_line_by + "'"
    end
    
    # if you have titles, add a number to skip those lines
    # so they don't get put into the db.
    if skip_num_lines != nil && skip_num_lines > 0
      db_str = db_str + " IGNORE " + skip_num_lines.to_s + " LINES"
    end
    
    # define the column names that you want to write to the db.
    # the actual names should match the db names.
    # if you dont want a column to be written, use @dummy.
    #
    # example
    # "@dummy, name, description"
    if col_names != nil
      db_str = db_str + " (" + 
               col_names + ")"
    end
    
    puts "> db query to write"
    puts db_str
    puts ""
    
    return db_str
  end
  

  #"LOAD DATA INFILE '/home/user/fleet.csv' " +
  #                            "INTO TABLE fleet " +
  #                            "FIELDS TERMINATED BY '\t' " +
  #                            "IGNORE 1 LINES " +
  #                            "(@dummy, name, description);"
  
end