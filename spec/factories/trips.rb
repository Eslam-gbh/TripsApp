FactoryBot.define do
    factory :trip do
        driver "Test Name"
        state "ongoing"
        location ["Test location"]
    end
end