require "./bullet.rb"
require "./event.rb"
require "./note.rb"
require "./page.rb"
require "./task.rb"

class BulletFactory
  def self.makeEmptyEvent
    page = Page.new
    return Event.new(nil, page)
  end

  def self.makeEmptyNote
    page = Page.new
    return Note.new(nil, page)
  end

  def self.makeEmptyTask
    page = Page.new
    return Task.new(nil , page)
  end

  def self.makeNoteByRaw( array )
    note = Note.new(nil,nil)
    note.noteID = array[0]
    note.desc = array[1]
    return note
  end

  def self.makeEventByRaw( array )
    event = Event.new(nil,nil)
    event.eventID = array[0]
    event.desc = array[1]
    event.fecha = array[2]
    return event
  end

  def self.makeTaskByRaw( array )
    task = Task.new(nil,nil)
    task.taskID = array[0]
    task.desc = array[1]
    task.fecha = array[2]
    task.status = array[3]
    return task
  end
end
