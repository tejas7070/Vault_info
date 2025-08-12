require 'rails_helper'

RSpec.describe "information/show", type: :view do
  before(:each) do
    assign(:information, Information.create!(
      title: "Title",
      main: "MyText",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
