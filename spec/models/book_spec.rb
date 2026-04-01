require 'rails_helper'

RSpec.describe Book, type: :model do
  subject {
    Book.new(name: "Spiderman", author: "Stan Lee", year: 1970)
  }

  it "é valido com todos atributos" do
    expect(subject).to be_valid
  end

  it "não é valido com a ausência do nome do livro" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "não é valido com a ausência do nome do autor" do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it "não é valido com a ausência do ano do livro" do
    subject.year = nil
    expect(subject).to_not be_valid
  end

  it "não é valido se o nome do autor do livro conter numero" do
    subject.author = "Mr. Jackie235"
    expect(subject).to_not be_valid
  end

end
