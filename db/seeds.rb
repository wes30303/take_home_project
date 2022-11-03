customer1 = Customer.create!(first_name: "Wes", last_name: "Mir", email: "test123", address: "123 Main St")
tea1 = Tea.create!(title: "Black Tea", description: "Best Tea In The World", temperature: "100", brew_time: "10 Min")

Subscription.create!(customer_id: customer1.id,
                              tea_id: tea1.id,
                              title: "Sample Tea Pack",
                              price: 20,
                              status: "True",
                              frequency: "Weekly")
Subscription.create!(customer_id: customer1.id,
                              tea_id: tea1.id,
                              title: "Blue Tea Pack",
                              price: 10,
                              status: "True",
                              frequency: "Monthly")
Subscription.create!(customer_id: customer1.id,
                              tea_id: tea1.id,
                              title: "Tea Pack",
                              price: 30,
                              status: "False",
                              frequency: "Monthly")
