FactoryGirl.define do
  factory :ticket do
    creator_name "Antony"
    creator_email  "antony@ronon.de"
    department 'engineering'
    subject 'computer crash'
    body 'My computer is not working'
  end
  
  factory :invalid_ticket, parent: :ticket do 
    creator_name nil
  end
  
  factory :second_ticket, parent: :ticket do
    subject 'second ticket'
    body 'second ticket'
  end
end
