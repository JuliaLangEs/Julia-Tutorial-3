#Apollo13 tutorial
#system.jl

 function update(me::EarthMoonSystem,time::Float64,h::Float64)
   # `me` is a reference to this instance of EarthMoonSystem
   me.time = time #system time
  update(me.moon,time) #tell the moon
   update(me.command_module,time,h) #tell the command module

   return me
 end


