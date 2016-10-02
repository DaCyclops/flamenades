


 -- Start OnLoad/OnInit/OnConfig events
script.on_configuration_changed( function(data)
  if data.mod_changes ~= nil and data.mod_changes["flamenades"] ~= nil and data.mod_changes["flamenades"].old_version == nil then
   -- Mod added 
    for _,force in pairs(game.forces) do
      force.reset_recipes()
      force.reset_technologies()

      local techs=force.technologies
      local recipes=force.recipes

      if techs["flame-thrower"].researched then
        recipes["flame-grenade"].enabled=true
      end

    end
    
  end 

  if data.mod_changes ~= nil and data.mod_changes["flamenades"] ~= nil and data.mod_changes["flamenades"].old_version ~= nil then
   -- Mod updated or removed
    for _,force in pairs(game.forces) do
      force.reset_recipes()
      force.reset_technologies()

      local techs=force.technologies
      local recipes=force.recipes


      if techs["flame-thrower"].researched then
        recipes["flame-grenade"].enabled=true
      end      
      
    end

  end

end)


script.on_init(function()
  -- Nothing to do now
end)   
  
script.on_load(function()
  --Nothing to Do Now  
end)
-- End OnLoad/OnInit/OnConfig events


