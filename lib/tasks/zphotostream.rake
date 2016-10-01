namespace :zphotostream do
  task setup: :environment do
    require 'highline'
    
    puts "\nSetting up a new user account\n\n"

    cli = HighLine.new
    email = cli.ask("Enter account email: ")
    password = cli.ask("Enter a password: ") { |q| q.echo = '*' }
    password_confirmation = cli.ask("Confirm password: ") { |q| q.echo = '*' }

    user = User.new(email: email, password: password, password_confirmation: password_confirmation)

    if user.save
      puts "User account successfully created"
    else
      puts "Error(s) encountered creating user account: #{user.errors.full_messages.join(", ")}"
    end
  end
end