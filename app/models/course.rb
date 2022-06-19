class Course
    attr_accessor :id,:title,:instructor,:date,:minEmployee,:maxEmployee,:employees,:is_alloted

    def initialize(id, title, instructor, date, minEmployee, maxEmployee)
        @id = id
        @title = title
        @instructor = instructor
        @date = date
        @minEmployee = minEmployee
        @maxEmployee = maxEmployee
        @employees = []
        @is_alloted = false
    end
end