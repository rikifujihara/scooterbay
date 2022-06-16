require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        title: "Title",
        brand: "Brand",
        price: 2,
        description: "MyText",
        sold: false,
        in_built_lighting: false,
        double_motor: false,
        pneumatic_tires: false,
        has_suspension: false,
        user: nil
      ),
      Listing.create!(
        title: "Title",
        brand: "Brand",
        price: 2,
        description: "MyText",
        sold: false,
        in_built_lighting: false,
        double_motor: false,
        pneumatic_tires: false,
        has_suspension: false,
        user: nil
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Brand".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
