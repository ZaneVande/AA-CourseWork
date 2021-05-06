require "employee"

class Startup
attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
      self.funding > startup.funding
    end

    def hire(name, title)
        if self.valid_title?(title)
          @employees << Employee.new(name, title)
        else
          raise "title is invalid"
        end
    end

    def size
        return @employees.count
    end

    def pay_employee(employee)
       money = @salaries[employee.title]
        if @funding >= money
            employee.pay(money)
            @funding -= money
        else
            raise "not enough funding"
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        total = 0
        @employees.each do |employee|
            total += @salaries[employee.title]
        end

        total / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |title, salary|
           if !@salaries.has_key?(title)
            @salaries[title] = salary
           end
        end
        @employees += startup.employees
        startup.close
    end
end
