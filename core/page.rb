class Page

  attr_accessor :num, :time

  def initialize
    @time = Time.now
    @num = nil
  end

  def hasPageNumber?
    return @num == nil
  end
end
