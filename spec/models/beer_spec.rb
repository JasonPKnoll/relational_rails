require 'rails_helper'

RSpec.describe Beer do
  it {should belong_to :brewery}
end
