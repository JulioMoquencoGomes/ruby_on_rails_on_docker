class FillBooksJob
  include Sidekiq::Job

  def perform(count)
    if count <= 10
      book = Book.new(name: "#{Faker::Name.prefix} #{Faker::Name.first_name}",
          author: Faker::Name.name, year: Faker::Number.between(from: 1700, to: 2026))
      book.save
      count = count.to_i + 1
      FillBooksJob.perform_in(10.seconds, count)
    end
  end
end
