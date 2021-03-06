require 'rspec'
require 'spec_helper'
require 'volunteer'
require 'pg'

describe Volunteer do

  describe '#volunteer_name' do
    it 'adds volunteer name' do
      expect(Volunteer.new(:volunteer_name => 'Sam Bob', :project_id => 1, :id => nil).volunteer_name).to eq('Sam Bob')
    end
  end

  describe '#project_id' do
    it 'adds volunteer project_id' do
      expect(Volunteer.new(:volunteer_name => 'Sam Bob', :project_id=> 1, :id => nil).project_id).to eq(1)
    end
  end

  describe '#id' do
    it 'sets volunteer ID' do
      expect(Volunteer.new(:volunteer_name => 'Sam Bob', :project_id=> 1, :id => 1).id).to be_an_instance_of Fixnum
    end
  end

  describe '.all' do
    it 'starts off with no volunteers' do
      expect(Volunteer.all).to eq([])
    end
  end

  describe '#==' do
    it 'is the same volunteer if they have the same name and project id' do
      volunteer1 = Volunteer.new(:volunteer_name => 'Sam Bob', :project_id=> 1, :id => nil)
      volunteer2 = Volunteer.new(:volunteer_name => 'Sam Bob', :project_id=> 1, :id => nil)
      expect(volunteer1).to eq(volunteer2)
    end
  end

  describe '#save' do
    it 'adds a volunteer to the volunteers array' do
    volunteer = Volunteer.new(:volunteer_name => 'Sam Bob', :project_id => 1, :id => nil)
    volunteer.save
    expect(Volunteer.all).to eq([volunteer])
    end
  end

  describe '#delete' do
    it 'deletes a volunteer from the database' do
      volunteer1 = Volunteer.new(:volunteer_name => 'Sam Bob', :project_id => 1, :id => nil)
      volunteer1.save
      volunteer2 = Volunteer.new(:volunteer_name => 'Kelli Sue', :project_id => 1, :id => nil)
      volunteer2.save
      volunteer2.delete
      expect(Volunteer.all).to eq([volunteer1])
    end
  end

  describe '#update' do
    it 'changes the volunteer name in the database' do
      volunteer = Volunteer.new(:volunteer_name => 'Sam Bob', :project_id => 1, :id => nil)
      volunteer.save
      volunteer.update(:volunteer_name => 'Sam Joe')
      expect(volunteer.volunteer_name).to eq('Sam Joe')
    end
  end
end
