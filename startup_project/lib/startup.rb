require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name_str, funding_num, salaries_hash)
        @name = name_str
        @funding = funding_num
        @salaries = salaries_hash
        #{title=>salary}
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(new_startup)
        self.funding > new_startup.funding
    end

    def hire(employee, title)
        if !valid_title?(title)
            raise_error
        else
            @employees << Employee.new(employee, title)
        end
    end

    def size
        @employees.count
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise "not enough funding"
        end
    end

    def payday
        employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total_salaries = 0
        @employees.each { |employee| total_salaries += @salaries[employee.title] }
        total_salaries / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding

        other_startup.salaries.each do |title, salary|
            if !@salaries.include?(title)
                @salaries[title] = salary
            end
        end

        other_startup.employees.each { |employee| @employees << employee }

        other_startup.close
    end
end
