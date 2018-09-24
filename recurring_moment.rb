require 'active_support'
require 'active_support/core_ext'
require 'pry'
class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    # binding.pry
    puts '--------------------------------'
    current = @start
    counter=1
    while current <= date
      if current == date
        puts 'true'
        return true
      end
      puts "current: #{current}"
      puts "date: #{date}"
      if @period == 'monthly'
        # binding.pry
        current = @start.advance(months: counter * @interval)
      elsif @period == 'weekly'
        current = @start.advance(weeks: counter * @interval)
      elsif @period == 'daily'
        current = @start.advance(days: counter * @interval)
      end
      counter+=1
    end
    puts 'false'
      return false


  end
end
