require "./core/bullet.rb"

class Event < Bullet
  attr_accessor :fecha , :desc, :eventID

  def initialize ( page )
    super( page )
    @desc = nil
    @fecha = nil
  end

  def hasDesc?
    return @desc != nil
  end
end
