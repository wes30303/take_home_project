require 'rails_helper'

describe "Tea Subscription" do
  it 'is able to subscribe to a user tea subscription' do
    customer1 = Customer.create!(first_name: "Wes", last_name: "Mir", email: "test123", address: "123 Main St")
    tea1 = Tea.create!(title: "Black Tea", description: "Best Tea In The World", temperature: "100", brew_time: "10 Min")

    create_new_sub = {
      'customer': customer1.id,
      'tea': tea1.id,
      'title': "Sample Tea Pack",
      'price': 20,
      'frequency': "Weekly",
    }

    post api_v1_subscription_index_path(create_new_sub)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    info = JSON.parse(response.body, symbolize_names: true)

    expect(Subscription.count).to eq(1)
    expect(info).to be_a Hash
    expect(info).to have_key(:customer_id)
    expect(info).to have_key(:tea_id)
    expect(info).to have_key(:title)
    expect(info).to have_key(:price)
    expect(info).to have_key(:frequency)
    expect(info).to have_key(:status)
  end
end
describe "Tea subscription" do
  it "is able to cancel a subscription" do
    customer1 = Customer.create!(first_name: "Wes", last_name: "Mir", email: "test123", address: "123 Main St")
    tea1 = Tea.create!(title: "Black Tea", description: "Best Tea In The World", temperature: "100", brew_time: "10 Min")
    subscription = Subscription.create!(customer_id: customer1.id,
      tea_id: tea1.id,
      title: "Sample Tea Pack",
      price: 20,
      status: "True",
      frequency: "Weekly")

    expect(Subscription.count).to eq(1)

    patch api_v1_subscription_path(subscription.id)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    info = JSON.parse(response.body, symbolize_names: true)

    expect(Subscription.count).to eq(1)
    expect(info).to be_a Hash
    expect(info).to have_key(:customer_id)
    expect(info).to have_key(:tea_id)
    expect(info).to have_key(:title)
    expect(info).to have_key(:price)
    expect(info).to have_key(:frequency)
    expect(info).to have_key(:status)
    expect(info[:status]).to eq("False")
  end

  it "will be able to get back all of the subscriptions" do
    customer1 = Customer.create!(first_name: "Wes", last_name: "Mir", email: "test123", address: "123 Main St")
    tea1 = Tea.create!(title: "Black Tea", description: "Best Tea In The World", temperature: "100", brew_time: "10 Min")
    subscription = Subscription.create!(customer_id: customer1.id,
      tea_id: tea1.id,
      title: "Sample Tea Pack",
      price: 20,
      status: "True",
      frequency: "Weekly")
    subscription2 = Subscription.create!(customer_id: customer1.id,
        tea_id: tea1.id,
        title: "Blue Tea Pack",
        price: 10,
        status: "True",
        frequency: "Monthly")
    subscription3 = Subscription.create!(customer_id: customer1.id,
        tea_id: tea1.id,
        title: "Tea Pack",
        price: 30,
        status: "False",
        frequency: "Monthly")


    get api_v1_subscription_index_path

    expect(response).to be_successful
    expect(response.status).to eq(201)
    info = JSON.parse(response.body, symbolize_names: true)

    expect(Subscription.count).to eq(3)
    expect(info).to be_a Array
  end
end
describe 'Sad Path Testing' do
  it "is able to not be able to create subscription" do
    create_new_sub = {
      'customer': "hello",
      'tea': "test",
      'title': "Sample Tea Pack",
      'price': 20,
      'frequency': "Weekly",
    }

    post api_v1_subscription_index_path(create_new_sub)

    expect(response).to_not be_successful
    expect(Subscription.count).to eq(0)
  end
  it "is able to not be able to create subscription with missing information" do
    customer1 = Customer.create!(first_name: "Wes", last_name: "Mir", email: "test123", address: "123 Main St")
    tea1 = Tea.create!(title: "Black Tea", description: "Best Tea In The World", temperature: "100", brew_time: "10 Min")

    create_new_sub = {
      'customer': customer1.id,
      'tea': tea1.id,
      'title': "Sample Tea Pack"
    }

    post api_v1_subscription_index_path(create_new_sub)

    expect(response).to_not be_successful
    expect(Subscription.count).to eq(0)
  end
  it "is able to cancel a subscription and fail when it has already be canceled" do
    customer1 = Customer.create!(first_name: "Wes", last_name: "Mir", email: "test123", address: "123 Main St")
    tea1 = Tea.create!(title: "Black Tea", description: "Best Tea In The World", temperature: "100", brew_time: "10 Min")
    subscription = Subscription.create!(customer_id: customer1.id,
      tea_id: tea1.id,
      title: "Sample Tea Pack",
      price: 20,
      status: "True",
      frequency: "Weekly")

      expect(Subscription.count).to eq(1)

      patch api_v1_subscription_path(subscription.id)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      info = JSON.parse(response.body, symbolize_names: true)

      expect(Subscription.count).to eq(1)
      expect(info).to be_a Hash
      expect(info).to have_key(:customer_id)
      expect(info).to have_key(:tea_id)
      expect(info).to have_key(:title)
      expect(info).to have_key(:price)
      expect(info).to have_key(:frequency)
      expect(info).to have_key(:status)
      expect(info[:status]).to eq("False")

      patch api_v1_subscription_path(subscription.id)
      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
end
