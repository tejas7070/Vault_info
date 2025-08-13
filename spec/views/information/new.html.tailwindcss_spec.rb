require 'rails_helper'

RSpec.describe "information/new", type: :view do
  before(:each) do
    assign(:information, Information.new(
      title: "MyString",
      main: "MyText",
      user: nil
    ))
  end

  it "renders new information form" do
    render

    assert_select "form[action=?][method=?]", information_index_path, "post" do
      assert_select "input[name=?]", "information[title]"

      assert_select "textarea[name=?]", "information[main]"

      assert_select "input[name=?]", "information[user_id]"
    end
  end
end
