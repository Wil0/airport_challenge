class Weather

  def stormy?
    random
  end

  private

  def random
    rand(1..6) > 4
  end

end
