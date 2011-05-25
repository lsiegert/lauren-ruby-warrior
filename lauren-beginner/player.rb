class Player

  @health_start = nil
  @health_end = nil

  def play_turn(warrior)
    init(warrior)
    
    if warrior.feel.empty? && warrior.health >= @health_end
      if warrior.health < @health_start
        warrior.rest!
      else
        warrior.walk!
      end
    else
      if warrior.feel.empty?
        warrior.walk!
      elsif warrior.feel.captive?
        warrior.rescue!
      else
        warrior.attack!
      end
    end
    @health_end = warrior.health
  end

  def init(warrior)
    @health_start = warrior.health unless @health_start
    @health_end = warrior.health unless @health_end
  end
  
end