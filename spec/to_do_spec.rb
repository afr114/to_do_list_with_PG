require('rspec')
require('task')

describe(Task) do
  before() do
    Task.clear()
  end

  describe('#description') do
    it('lets you give it a description') do
      test_task = Task.new('buy groceries')
      expect(test_task.description()).to(eq('buy groceries'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a task to the array of saved tasks') do
    test_task = Task.new('wash the lion')
    test_task.save()
    expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.clear') do
    it('empties all saved tasks from array') do
      Task.new('wash the lion').save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

end
