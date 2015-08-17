require('rspec')
require('list')
require('PG')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe(List) do

  describe('.all') do
    it('starts with no lists') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('shows the name') do
      list = List.new({:name => "Epicodus Stuff", id => nil})
      expect(List.name()).to(eq("Epicodus Stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus Stuff", id => nil})
        list.save()
        expect(list.id()).to(be_an_instance_of(Fixnum))
      end
    end

  describe('#save') do
    it('saves list to array') do
      list = List.new({:name => 'Epicodus Stuff', id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe('#==') do
    it('is the same list if it shares an id') do
      list = List.new({:name => 'Epicodus Stuff', id => nil})
      list2 = List.new({:name => 'Epicodus Stuff', id => nil})
      expect(list()).to(eq(list2))
    end
  end

end #end RSpec
