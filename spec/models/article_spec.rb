require 'rails_helper'
require 'spec_helper'

describe Article do
  describe ".latest_ten" do
    it 'returns the most recent ten or less articles' do
      expect(Article.latest_ten.count).to be <= 10
    end
  end

end
