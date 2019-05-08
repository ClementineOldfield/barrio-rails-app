class Address < ApplicationRecord
  belongs_to :user

  enum state: { 
    QLD: 0, 
    NSW: 1, 
    VIC: 2, 
    TAS: 3, 
    SA: 4, 
    WA: 5, 
    ACT: 6, 
    NT: 7 
  }
  
end
