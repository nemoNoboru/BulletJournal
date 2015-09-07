require "./bullet.rb"

class Note < Bullet
  attr_accessor :desc, :noteID

  def initialize( bulletID , page )
    super(page, bulletID )
    @noteID = nil
    @desc = nil
  end

  def hasNoteId?
    return @noteID != nil
  end

  def hasDesc?
    return @desc != nil
  end
end
