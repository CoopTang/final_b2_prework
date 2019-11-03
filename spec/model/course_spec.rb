require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :student_courses }
    it { should have_many(:students).through(:student_courses) }
  end

  describe 'class methods' do

  end

  describe 'instance methods' do

  end
end