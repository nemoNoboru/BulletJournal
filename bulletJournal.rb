require 'sinatra'
require 'core/dbmanager.rb'

manager = Manager.new

get '/' do
  call env.merge("PATH_INFO" => '/getpage/current')
end

get '/getpage/:page' do |page|
  if page == "current" then
    page = manager.getLastPage
  end
  $notes = manager.getNotesByPage page
  $events = manager.getEventsByPage page
  $tasks = manager.getTasksByPage page
  erb :getPage
end
