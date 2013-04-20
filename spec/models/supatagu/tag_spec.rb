require 'spec_helper'

module Supatagu
  describe 'Tag' do
    it :exists do 
      defined?(Tag).should be_true
    end
  end
end
