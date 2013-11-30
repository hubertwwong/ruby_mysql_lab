require_relative "mysql_csv_import"

credentials = {:url => "localhost",
               :db_name => "space_ship",
               :user => "root", 
               :password => "password"}
mci = MySQLCSVImport.new credentials
              
opt = {:filename => "/home/user/fleet.csv",
       :table_name => "fleet",
       :skip_num_lines => 1,
       :term_fields_by => "\t",
       :enclosed_by => nil,
       :escaped_by => nil,
       :term_line_by => "\n\r",
       :col_names => "@dummy, name, description"}
mci.import_csv opt