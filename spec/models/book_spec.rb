require 'rails_helper'

RSpec.describe Book, type: :model do
  
  let!(:book) { build(:book) }

  it "é valido com todos atributos" do
    expect(book).to be_valid
  end

  it "não é valido com a ausência do nome do livro" do
    book.name = nil
    expect(book).to_not be_valid
  end

  it "não é valido com a ausência do nome do autor" do
    book.author = nil
    expect(book).to_not be_valid
  end

  it "não é valido com a ausência do ano do livro" do
    book.year = nil
    expect(book).to_not be_valid
  end

  it "não é valido se o nome do autor do livro conter numero" do
    book.author = "Mr. Jackie235"
    expect(book).to_not be_valid
  end

end
