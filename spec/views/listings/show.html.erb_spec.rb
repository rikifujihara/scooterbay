require 'rails_helper'

RSpec.describe "listings/show", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
