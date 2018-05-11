class Post < ApplicationRecord
  has_many :comments
  belongs_to :category

  validates :name, presence: true

  validates :name, presence: true, format: { 
    with: /[a-z]+\ [a-z\ A-Z]{2,}/,
    message: "must contains minimum 2 words of minimum 2 letters" 
  }
  validates :name, format: { 
    with: /\.\z/,
    message: "must ends with '.'" 
  }
  validates :name, format: { 
    with: /\A[A-Z]/,
    message: "must starts with capital letter" 
  }
end
