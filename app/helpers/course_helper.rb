class CourseHelper
    def registerCourse(employee,course)
        if course.employees.size() >= course.maxEmployee            
            puts "COURSE_FULL_ERROR"
        end
        course.employees << [employee,"REG-COURSE-#{employee.split("@")[0]}-#{course.title}"]
        "REG-COURSE-#{employee.split("@")[0]}-#{course.title} ACCEPTED"
    end

    def cancelCourse(employee,reg_id,course)
        if course.is_alloted
            "CANCEL_REJECTED"
        else
            course.employees.delete_if {|i| i[0] == employee && i[1]==reg_id}
            "CANCEL_ACCEPTED"
        end
    end

    def allotCourse(course)
        course.is_alloted = true
    end
end