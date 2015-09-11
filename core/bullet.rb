require "./core/page.rb"
class Bullet

  attr_accessor :page, :idBullet

  def initialize (page)
    @page = page
  end

  def hasPage?
    return @page != nil
  end
end
