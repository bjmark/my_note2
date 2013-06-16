require 'spec_helper'

describe "Searches" do
  specify do
    visit '/'
    current_path.should == '/'
    page.should have_content 'New'

    #search with a blank
    click_button 'Search'
    current_path.should == '/notes'

    #create
    click_link 'New'
    current_path.should == '/notes/new'

    fill_in('content',:with=>'test_abc')
    fill_in('names',:with=>"ruby \n rails")
    click_button 'Save'
    current_path.should == '/notes'
    Note.count.should == 1

    #search 'rub'
    fill_in('word',:with=>'rub')
    click_button('Search')
    page.should have_content 'test_abc'

    #search 'rails'
    fill_in('word',:with=>'rails')
    click_button('Search')
    page.should have_content 'test_abc'
  end
end
