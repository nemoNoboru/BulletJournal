require "./bullet.rb"

class Event < Bullet
  attr_accessor :fecha , :desc, :eventID

  def initialize (bulletID , page )
    super( page, bulletID )
    @eventID = nil
    @desc = nil
    @fecha = nil
  end

  def hasEventId?
    return @eventID != nil
  end

  def hasDesc?
    return @desc != nil
  end
end
