require "./bulletFactory.rb"
require "./Driver.rb"

class Manager
  def initialize
    @db = Driver.new
  end

  def getNotesByPage ( pageNumber )
    notes = Array.new
    data = @db.getNotesByPage pageNumber
    if data == nil then
      return nil
    end
    data.each do |row|
      notes.push BulletFactory.makeNoteByRaw row
    end
    return notes
  end

  def getEventsByPage ( pageNumber )
    events = Array.new
    data = @db.getEventsByPage pageNumber
    if data == nil then
      return nil
    end
    data.each do |row|
      events.push BulletFactory.makeEventByRaw row
    end
    return events
  end

  def getTasksByPage ( pageNumber )
    taks = Array.new
    data = @db.getTasksByPage pageNumber
    if data == nil then
      return nil
    end
    data.each do |row|
      taks.push BulletFactory.makeTaskByRaw row
    end
    return taks
  end

  def insertNoteByPage( note , page )
    if ! note.hasPage? then
      return nil
    end
    if ! note.hasNoteId? then
      note.noteID = @db.getLastID "Notes"
    end
    if ! note.hasBulletId? then
      note.idBullet = @db.getLastID "Bullets"
    end
    if ! note.page.hasPageNumber? then
      note.page.num = page
    end
    @db.insertPage( note.page.num , note.page.time )
    @db.insertBullet( note.idBullet , note.noteID, note.page.num )
    @db.insertNote( note.noteID , note.desc )
  end
end
