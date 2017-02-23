require './Stack.rb'
require './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll

  def initialize (jobs_available, job_seekers)
    @waiting = Queue.new
    @workers = Stack.new
    job_seekers.times do |i|
      @waiting.enqueue("Worker \##{i+1}")
    end
    while @workers.size != jobs_available
      @workers.push( @waiting.dequeue )
    end
  end

  def cycle
    @roll = rand(6) + 1
    puts "Managers roll a #{@roll}"
    @roll.times do
      fired = @workers.pop
      puts "FIRE:\t#{fired}"
      @waiting.enqueue(fired)
    end
    @roll.times do
      hired = @waiting.dequeue
      puts "HIRE:\t#{hired}"
      @workers.push(hired)
    end
  end
end

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(6,10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

count = 0
until gets.chomp != ""
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end
