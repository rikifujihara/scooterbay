require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      title: "MyString",
      brand: "MyString",
      price: 1,
      description: "MyText",
      sold: false,
      in_built_lighting: false,
      double_motor: false,
      pneumatic_tires: false,
      has_suspension: false,
      user: nil
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[brand]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "textarea[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[sold]"

      assert_select "input[name=?]", "listing[in_built_lighting]"

      assert_select "input[name=?]", "listing[double_motor]"

      assert_select "input[name=?]", "listing[pneumatic_tires]"

      assert_select "input[name=?]", "listing[has_suspension]"

      assert_select "input[name=?]", "listing[user_id]"
    end
  end
end
