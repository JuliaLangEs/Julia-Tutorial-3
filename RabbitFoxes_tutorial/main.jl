


start_time = 0
end_time = 100

time_step = 1/4
end_step = int(((end_time - start_time)/time_step))

initial_rabbits = 30000

initial_foxes = 15

rabbits_killed_per_fox_birth = 1000

chance_rabbit_die_during_meeting = 0.50

chance_of_meeting = 0.02

rabbit_growth_rate = 0.20

fox_death_rate = 0.10

rabbits_over_time = fill(0.0,end_step +1)
foxes_over_time = fill(0.0,end_step +1)
model_time = fill(0.0,end_step+1)

rabbits = initial_rabbits
foxes = initial_foxes

rabbits_over_time[1] = rabbits
foxes_over_time[1] = foxes


#simulation
for sim_step =1:end_step
  # get the time from the step
  sim_time = start_time + sim_step + time_step
  model_time[sim_step] = sim_time

  #flows
  rabbit_births = rabbits*rabbit_growth_rate
  rabbits_eaten = min(rabbits,chance_rabbit_die_during_meeting*chance_of_meeting*foxes*rabbits)

  fox_births = 1/rabbits_killed_per_fox_birth*rabbits_eaten
  fox_deaths = foxes*fox_death_rate

  #update stocks
  foxes = foxes + fox_births - fox_deaths
  rabbits = rabbits + rabbit_births - rabbits_eaten

  # stock values update over time step
  rabbits_over_time[sim_step+1] = rabbits
  foxes_over_time[sim_step+1] = foxes



end

println("Time,Rabbits (Thousands),Foxes")
for i = 1:end_step
  print(model_time[i])
  print(",")
  print(rabbits_over_time[i]/1000)
  print(",")
  println(foxes_over_time[i])
end

using Gadfly


plot(x=model_time[:], y=foxes_over_time[:])
plot(x=model_time[:], y=rabbits_over_time[:]./1000)
