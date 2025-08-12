require 'rails_helper'

RSpec.describe "information/index", type: :view do
  before(:each) do
    assign(:information, [
      Information.create!(
        title: "Title",
        main: "MyText",
        user: nil
      ),
      Information.create!(
        title: "Title",
        main: "MyText",
        user: nil
      )
    ])
  end

  it "renders a list of information" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
