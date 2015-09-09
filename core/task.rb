require "./bullet.rb"

class Task < Bullet
  attr_accessor :taskID, :desc, :status, :fecha

  def initialize ( page )
    super( page )
    @desc = nil
    @status = nil
    @fecha = nil
  end

  def hasDesc?
    return @desc != nil
  end

  def getStatus
    if @status == 0 then return "Not completed" end
    if @status == 1 then return "In process" end
    if @status == 2 then return "Completed" end
  end
end
