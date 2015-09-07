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

  def insertEventByPage( event , page )
    if ! event.hasPage? then
      return nil
    end
    if ! event.hasEventId? then
      event.eventID = @db.getLastID "Events"
    end
    if ! event.hasBulletId? then
      event.idBullet = @db.getLastID "Bullets"
    end
    if ! event.page.hasPageNumber? then
      event.page.num = page
    end
    @db.insertPage( event.page.num , event.page.time )
    @db.insertBullet( event.idBullet , event.eventID, event.page.num )
    @db.insertEvent( event.eventID , event.desc , event.fecha )
  end

  def insertTaskByPage( task , page )
    if ! task.hasPage? then
      return nil
    end
    if ! task.hasTaskId? then
      task.taskID = @db.getLastID "Tasks"
    end
    if ! task.hasBulletId? then
      task.idBullet = @db.getLastID "Bullets"
    end
    if ! event.page.hasPageNumber? then
      task.page.num = page
    end
    @db.insertPage( task.page.num , task.page.time )
    @db.insertBullet( task.idBullet , task.taskID, task.page.num )
    @db.insertEvent( task.taskID , task.desc , task.fecha, task.status )
  end
end
