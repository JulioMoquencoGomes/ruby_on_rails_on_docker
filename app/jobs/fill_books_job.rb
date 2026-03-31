class FillBooksJob
  include Sidekiq::Job

  def perform(count = 0)
    
    cont = cont.to_i + 1

    if cont <= 10
      book = Book.new(name: "#{Faker::Name.prefix} #{Faker::Name.first_name}",
          author: Faker::Name.name, year: Faker::Number.between(from: 1700, to: 2026))
      book.save
      FillBooksJob.perform_in(10.seconds, cont)
    end

  end
end
