# This one holds the classes and build our ORMS here
# class mapped to tables 
# attributes are mapped to columns
# attributes values are mapped to rows

class Student
    # we define attributes using initialize method
    attr_accessor :id, :name, :email, :course
    def initialize(id: nil, name:, email:, course:)
        @id = id
        @name = name 
        @email = email
        @course = course
    end   
    
    # class methods ==> table
    def self.create_table
        table = <<-SQL
        CREATE TABLE students(
            id INTEGER PRIMARY KEY,
            name TEXT
            email TEXT
            course TEXT
        )
        SQL
        DB[:conn].execute(table)
    end  
    
    def save
        row = <<-SQL
        INSERT INTO students(name, email, course)
        VALUES(?,?,?) 
        SQL
        DB[:conn].execute(row, self.name, self.email, self.course)
    end    
end 

#instance of the class
# student1 = Student.new(id: 1, name: "Meshack", email: "meshackkorir100@gmail.com", course: "software developer")
# puts student1.course
