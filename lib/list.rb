class List < ActiveRecord::Base

def tasks
  list_tasks = []
  tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id()};")
  tasks.each() do |task|
    description = task.fetch("description")
    list_id = task.fetch("list_id").to_i()
    list_tasks.push(Task.new({:description => description, :list_id => list_id}))
  end
  list_tasks
end

end
