require "./page.rb"
class Bullet

  attr_accessor :page, :idBullet

  def initialize (page , bulletid)
    @page = page
    @idBullet = bulletid
  end

  def hasPage?
    return @page != nil
  end

  def hasBulletId?
    return @idBullet != nil
  end
end
