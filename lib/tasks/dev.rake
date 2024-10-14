namespace :dev do
  desc "Configure environment"
  task setup: :environment do
    puts "Registering contact types!"

    kinds = %w(Comercial Friend Brother)
    kind_records = kinds.map do |kind| 
      Kind.create!(description: kind)
    end

    puts "Contact types successfully registered!"

    puts "Registering contacts"
    100.times do |i|
      contact = Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind_id: kind_records.sample.id
      )

      # Criação de telefones associados ao contato
      Random.rand(5).times do
        phone = Phone.create!(number: Faker::PhoneNumber.phone_number, contact: contact)
      end
    end

    puts "Contacts successfully registered!"

    puts "Phones successfully registered!"
  end
end

