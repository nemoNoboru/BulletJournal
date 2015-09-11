require "./core/bullet.rb"
require "./core/event.rb"
require "./core/note.rb"
require "./core/page.rb"
require "./core/task.rb"

class BulletFactory
  def self.makeEmptyEvent
    page = Page.new
    return Event.new(page)
  end

  def self.makeEmptyNote
    page = Page.new
    return Note.new(page)
  end

  def self.makeEmptyTask
    page = Page.new
    return Task.new(page)
  end

  def self.makeNoteByRaw( array )
    note = Note.new(nil)
    note.desc = array[1]
    return note
  end

  def self.makeEventByRaw( array )
    event = Event.new(nil)
    event.desc = array[1]
    event.fecha = array[2]
    return event
  end

  def self.makeTaskByRaw( array )
    task = Task.new(nil)
    task.desc = array[1]
    task.fecha = array[2]
    task.status = array[3]
    return task
  end
end
