require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
require('./lib/task')
require('./lib/list')
also_reload('lib/**/*.rb')
require('pg')

get('/') do
  erb(:index)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

get('/lists/new') do
  erb(:lists_form)
end

post('/lists') do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  @lists = List.all()
  erb(:lists)
end

get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  erb(:tasks_form)
end

get("/tasks") do
  @task = params.fetch("list_id").to_i()
  erb(:tasks)
end

post('/tasks') do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id})
  @task.save()
  erb(:tasks)
end
