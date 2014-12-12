class CalendarsController < ApplicationController

  def show(date = Date.today)
    @date = date
    @first_day_of_month = Date.parse("#{@date.month}/ #{@date.year}")
    @fdofw = @first_day_of_month - @first_day_of_month.wday
    @last = @first_day_of_month.next_month - 1
    @weeks = ((@last.strftime("%W").to_i -  @fdofw.strftime("%W").to_i) % 52 ) - 1

  end




end
