# This one will link the DB to ruby and VS
require "bundler" #this helps you to down;oad all the packages or gems
Bundler.require

#add the class files
require_relative `students.rb`

#connect db to ruby

DB = {conn: SQLite3::Database.new("student.db")}