require 'rails_helper'

describe Post, type: :model do
  let(:category) { Category.create(name: 'New category', description: 'Description') }
  subject { described_class.new(category: category) }

  it 'is not valid without name' do
    expect(subject).not_to be_valid
  end

  it 'is not valid if name contains less than 2 words' do
    subject.name = 'New'
    expect(subject).not_to be_valid
  end

  it 'is not valid if words of name contains less than 2 letters' do
    subject.name = 'New a'
    expect(subject).not_to be_valid
  end

  it 'is not valid if name does not end with dot' do
    subject.name = 'New post'
    expect(subject).not_to be_valid
  end

  it 'is not valid if name does not start with capital letter' do
    subject.name = 'new post.'
    expect(subject).not_to be_valid
  end

  it 'is valid if name valid' do
    subject.name = 'New post.'
    expect(subject).to be_valid
  end  
end