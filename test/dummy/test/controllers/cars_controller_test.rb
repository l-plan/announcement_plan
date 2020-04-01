require "test_helper"

describe CarsController do
  let(:car) { cars(:one) }

  it "should get index" do
    get cars_url
    must_respond_with :success
  end

  it "should get new" do
    get new_car_url
    must_respond_with :success
  end

  it "should create car" do
    assert_difference("Car.count") do
      post cars_url, params: { car: { color: @car.color, name: @car.name, user_id: @car.user_id } }
    end

    must_redirect_to car_url(Car.last)
  end

  it "should show car" do
    get car_url(@car)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_car_url(@car)
    must_respond_with :success
  end

  it "should update car" do
    patch car_url(@car), params: { car: { color: @car.color, name: @car.name, user_id: @car.user_id } }
    must_redirect_to car_url(car)
  end

  it "should destroy car" do
    assert_difference("Car.count", -1) do
      delete car_url(@car)
    end

    must_redirect_to cars_url
  end
end
