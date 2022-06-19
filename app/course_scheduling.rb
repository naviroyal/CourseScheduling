require_relative './models/course'
require_relative './helpers/course_helper'

class CourseScheduling
    @courses = Hash.new()
    @id = 0
    puts "Enter File Location"
    #Input will be type "app/sample_input/input1.txt"
    File.readlines(gets.chomp).each do |line|
        data = line.split()
        case data[0]
        when "ADD-COURSE-OFFERING"
            if(data.size()<5)
                puts "INPUT_DATA_ERROR"    
            else
                @id = @id + 1
                course = Course.new(@id,data[1],data[2],data[3],data[4].to_i,data[5].to_i)
                course_key = "OFFERING-#{data[1]}-#{data[2]}"
                @courses[course_key] = course
                puts course_key
            end
        
        when "REGISTER"
            if(data.size()<3)
                puts "INPUT_DATA_ERROR"    
            else
                course = @courses[data[2]]
                employee = data[1]
                c1 = CourseHelper.new()
                puts c1.registerCourse(employee,course) 
            end

        when "ALLOT"
            if(data.size()<2)
                puts "INPUT_DATA_ERROR"    
            else
                course = @courses[data[1]]
                c1 = CourseHelper.new()
                if c1.allotCourse(course)
                    course.employees.each do |employee|
                        puts "#{employee[1]} #{employee[0]} #{course.title} #{course.instructor} #{course.date} CONFIRMED"
                    end
                end
            end

        when "CANCEL"
            if(data.size()<2)
                puts "INPUT_DATA_ERROR"    
            else
                course_key = "OFFERING-#{data[1].split("-")[3]}"
                course = nil
                @courses.each do |k,v|
                    if k.split("-")[1]==data[1].split("-")[3]
                        course = v
                        break
                    end
                end
                employee = "#{data[1].split("-")[2]}@GMAIL.COM"
                c1 = CourseHelper.new()
                puts "#{data[1]} #{c1.cancelCourse(employee,data[1],course)}" 
            end
        end
    end
end