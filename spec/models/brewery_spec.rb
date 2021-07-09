require 'rails_helper'

RSpec.describe Brewery do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :beers}
  end

  describe 'instance methods' do
    
  end

end
