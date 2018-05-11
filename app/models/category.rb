class Category < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :name, presence: true

  validates :name, format: {
    with: /[a-z]+\ [a-z\ A-Z]{2,}/,
    message: "must contains minimum 2 words of minimum 2 letters" 
  }
  validates :name, format: { 
    with: /\.\z/,
    message: "must ends with '.'" 
  }
  validates :name, format: { 
    with: /\A[[:upper:]]/,
    message: "must starts with capital letter" 
  }
end
