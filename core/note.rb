require "./bullet.rb"

class Note < Bullet
  attr_accessor :desc, :noteID

  def initialize( page )
    super(page)
    @desc = nil
  end

  def hasDesc?
    return @desc != nil
  end
end
