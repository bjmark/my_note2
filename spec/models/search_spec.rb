require 'spec_helper'

describe Search do
  specify 'add' do
    Search.create!(:word=>'ruby',:kind=>'like')
    Search.create!(:word=>'rails',:kind=>'index')
    Search.add('rails',:kind=>'search')

    Search.count.should == 2
    Search.order("id desc").first.word.should == 'rails'
  end
end
