class Task < ActiveRecord::Base
  # attr_reader(:description, :list_id)
  #
  # define_method(:initialize) do |attributes|
  #   @description = attributes.fetch(:description)
  #   @list_id = attributes.fetch(:list_id)
  # end
  #
  # define_singleton_method(:all) do
  #   returned_tasks = DB.exec("Select * FROM tasks;")
  #   tasks = []
  #   returned_tasks.each do |task|
  #     description = task.fetch("description")
  #     list_id = task.fetch("list_id").to_i()
  #     tasks.push(Task.new({:description => description, :list_id => list_id}))
  #   end
  #   tasks
  # end
  #
  # define_method(:save) do
  #   DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}') RETURNING list_id;")
  # end
  #
  # define_method(:==) do |another_task|
  #   self.list_id().== another_task.list_id()
  # end
  #

end
