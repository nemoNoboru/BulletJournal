# Driver to interact with the sqlite3 database
# Made by Felipe Vieira

require "sqlite3"

class Driver
  def initialize
    @db = SQLite3::Database.new "journal.db"
  end

  def executeQuery( query )
    begin
      data = @db.execute query
      return data
    rescue Exception
      return nil
    end
  end

  def getLastID ( table )
    query = "select count(ID) duplicates from "
    if table == "Pages"
      query = query.gsub("ID","NUM")
    end
    query = query + table
    (executeQuery query)[0][0]
  end

  def getNotesByPage( page ) #refactor this
    query = "select Notes.ID, Notes.Desc
             from Notes,Bullets,Pages
             where Bullets.ID = Page_ID and
             Bullets.Herency_ID = Notes.ID and
             Pages.NUM = #{page}"
    executeQuery query
  end

  def getEventsByPage( page ) #refactor this
    query = "select Events.ID, Events.Desc , Events.Fecha
             from Events,Bullets,Pages
             where Bullets.ID = Page_ID and
             Bullets.Herency_ID = Events.ID and
             Pages.NUM = #{page}"
    executeQuery query
  end

  def getTasksByPage( page ) #refactor this
    query = "select Tasks.ID, Tasks.Desc,Tasks.Fecha , Tasks.Estado
             from Tasks,Bullets,Pages
             where Bullets.ID = Page_ID and
             Bullets.Herency_ID = Tasks.ID and
             Pages.NUM = #{page}"
    executeQuery query
  end

  def insertBullet( id, herency_id, page_id )
    query = "insert into Bullets values (?,?,?)"
    begin
      @db.execute(query,[id, herency_id,page_id])
      return true
    rescue Exception
      return false
    end
  end

  def insertPage( num, fecha )
    query = "insert into Pages values(?,?)"
    begin
      @db.execute(query,[num,fecha])
      return true
    rescue Exception
      return false
    end
  end

  def insertNote(id, desc)
    query = "insert into Notes values(?,?)"
    begin
      @db.execute(query,[id,desc])
      return true
    rescue Exception
      return false
    end
  end

  def insertEvent( id, desc, fecha )
    query = "insert into Events values(?,?,?)"
    begin
      @db.execute(query,[id,desc,fecha])
      return true
    rescue Exception
      return false
    end
  end

  def insertTasks( id, desc , fecha, estado )
    query = "insert into Tasks values(?,?,?,?)"
    begin
      @db.execute(query,[id,desc,fecha,estado])
      return true
    rescue Exception
      return false
    end
  end
end
