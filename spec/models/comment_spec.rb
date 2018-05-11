require 'rails_helper'

describe Comment, type: :model do
  subject { described_class.new(author: 'John Dow.', content: 'Content ' * 10) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without content' do
    subject.content = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid if author contains less than 2 words' do
    subject.author = 'John.'
    expect(subject).not_to be_valid
  end

  it 'is not valid if each words of author contains less than 2 letters' do
    subject.author = 'John D.'
    expect(subject).not_to be_valid
  end

  it 'is not valid if author does not end with dot' do
    subject.author = 'John Dow'
    expect(subject).not_to be_valid
  end

  it 'is not valid if author does not start with capital letter' do
    subject.author = 'John dow.'
    expect(subject).not_to be_valid
  end

  it 'is not valid if each words of author does not start with capital letter' do
    subject.author = 'john Dow.'
    expect(subject).not_to be_valid
  end
end