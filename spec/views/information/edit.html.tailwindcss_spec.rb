require 'rails_helper'

RSpec.describe "information/edit", type: :view do
  let(:information) {
    Information.create!(
      title: "MyString",
      main: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:information, information)
  end

  it "renders the edit information form" do
    render

    assert_select "form[action=?][method=?]", information_path(information), "post" do
      assert_select "input[name=?]", "information[title]"

      assert_select "textarea[name=?]", "information[main]"

      assert_select "input[name=?]", "information[user_id]"
    end
  end
end
