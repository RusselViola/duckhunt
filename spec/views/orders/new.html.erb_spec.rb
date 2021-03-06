require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString"
    ))
  end

  xit "renders new order form" do
    render

    assert_select "form[action=?][method=?]", listing_orders_path, "post" do

      assert_select "input#order_address[name=?]", "order[address]"

      assert_select "input#order_city[name=?]", "order[city]"

      assert_select "input#order_state[name=?]", "order[state]"

      assert_select "input#order_zip_code[name=?]", "order[zip_code]"
    end
  end
end
