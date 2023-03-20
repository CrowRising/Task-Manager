require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'instance methods' do
    describe '#laundry?' do
      it 'returns true when the title is laundry' do
        task = Task.create!(title: 'laundry', description: 'clean clothes')

        expect(task.laundry?).to be(true)
      end

      it 'returns true when the description is laundry' do
        task = Task.create!(title: 'Clean my clothes', description: 'laundry')
    
        expect(task.laundry?).to be(true)
      end

      it 'returns false when neither the description nor title is laundry' do
        task = Task.create!(title: 'Wash the dishes', description: 'dishes')

        expect(task.laundry?).to be(false)
      end

      it 'returns true when the title contains the word laundry' do
        task = Task.create!(title: 'Do the laundry', description: 'linens and towels')

        expect(task.laundry?).to be(true)
      end

      it 'is case insensitive when checking if the title contains the word laundry' do
        task = Task.create!(title: 'do the LAundry', description: 'bedding')
        expect(task.laundry?).to be(true)
      end

      it 'returns true when the description contains the word laundry' do
        task = Task.create(title: 'Wash', description: 'laundry day')
        expect(task.laundry?).to be(true)
      end

      it 'is case insensitive when checking if the description contains the word laundry' do
        task = Task.create(title: 'Wash n Fold', description: 'lauNDRy day')
        expect(task.laundry?).to be(true)
      end


    end
  end
end