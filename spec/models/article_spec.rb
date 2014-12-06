require 'rails_helper'
require 'spec_helper'

describe Article do
  describe ".latest_ten" do
    it 'returns the most recent number or less articles' do
      number=2
      expect(Article.latest(number).count).to be <= number
    end
  end

  describe "#content_snippet" do
    it 'returns the first number words of the body of an article' do
      number = 50
      article = Article.create(title: "Cats", content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      expect(article.content_snippet(number).split(" ").length).to be <= number
    end
  end

end
