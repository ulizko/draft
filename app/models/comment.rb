class Comment < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :post, optional: true

  validates :author, :content, presence: true

  validates :author, presence: true, format: { 
    with: /[a-z]+\ [a-z\ A-Z]{2,}/,
    message: "must contains minimum 2 words of minimum 2 letters" 
  }
  validates :author, format: { 
    with: /\.\z/,
    message: "must ends with '.'" 
  }
  validates :author, format: { 
    with: /([:<:[:upper:]]\w+\ )+([:<:[:upper:]]\w+)/,
    message: "all contains words must start with capital letter" 
  }
end
