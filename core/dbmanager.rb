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

    noteID = @db.getLastID "Notes"
    idBullet = @db.getLastID "Bullets"

    @db.insertPage( page , note.page.time )
    @db.insertBullet( idBullet , noteID, page)
    @db.insertNote( noteID , note.desc )
  end

  def insertEventByPage( event , page )
    if ! event.hasPage? then
      return nil
    end

    eventID = @db.getLastID "Events"
    idBullet = @db.getLastID "Bullets"

    @db.insertPage( page , event.page.time )
    @db.insertBullet( idBullet , eventID, page)
    @db.insertEvent( eventID , event.desc , event.fecha )
  end

  def insertTaskByPage( task , page )
    if ! task.hasPage? then
      return nil
    end

    taskID = @db.getLastID "Tasks"
    idBullet = @db.getLastID "Bullets"

    @db.insertPage( page , task.page.time )
    @db.insertBullet( idBullet , taskID, page)
    @db.insertEvent( taskID , task.desc , task.fecha, task.status )
  end

  def getIndex
    return @db.getIndex
  end

end
