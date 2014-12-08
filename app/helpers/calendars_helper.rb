module CalendarsHelper
  require 'date'

  class Calendar

    attr_reader :month, :year, :first_day, :last_day, :days

    def initialize(month = Date.today.strftime("%B"), year = Date.today.strftime("%Y"))
      @month = month
      @year = year
      @first_day = Date.parse(month + " " + year)
      @last_day = @first_day.next_month - 1
      @days = (@last_day + 1 - @first_day).to_i
    end

    def self.month(month = Date.today.strftime("%B"), year = Date.today.strftime("%Y") )
      first_day = Date.parse(month + " " + year)
      first_week_day = first_day - (first_day.cwday)
      last_day = first_day.next_month.prev_day
      last_week_day = last_day + ((-last_day.wday) % 7)
      number_of_days = (last_week_day - first_week_day).to_i
      this_month = [first_week_day]
      [1...number_of_days].each do |day|
        this_month << (first_week_day + day).strftime("%b-%-d")
      end
      return this_month


      # this method should return an array of the form ["Dec-1","Dec-2"...] for
      # each day in the month plus preceding days and trailing days to fill up
      # the calendar. Next method will take these and put them in boxes along with
      # empty div's for calendar events.








    end

  end
end
