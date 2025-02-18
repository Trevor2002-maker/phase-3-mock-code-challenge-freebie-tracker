class Company < ApplicationRecord
    has_many :freebies
    has_many :devs, through: :freebies
  
    def give_freebie(dev, item_name, value)
      freebie = Freebie.create(dev: dev, company: self, item_name: item_name, value: value)
      freebie.save
      freebie
    end
  
    def self.oldest_company
      order(:founding_year).first
    end
