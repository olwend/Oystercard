class Station

  def initialize hash
    @name = hash[:name]
    @zone = hash[:zone]
  end


  def name
    @name
  end

  def zone
    @zone
  end
end
