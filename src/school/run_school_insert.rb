#
# TODO need to figure how to allow program to run multiple times.
# if you run this multiple times, its going to insert more data..

require_relative 'school_insert'

# init the school query object.
si = SchoolInsert.new

# insert some random data.
#si.insert_roles
#si.insert_users
#si.insert_subjects
#si.insert_periods
#si.insert_schedules
si.insert_student_schedules
#si.insert_student_schedules