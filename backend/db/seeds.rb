User.create!(name: 'foobar', email: 'foobar@example.com', password: 'foobar', password_confirmation: 'foobar')

3.times do |number|
  Message.create!(content: "#{number}番目のメッセージです！", user_id: User.first.id)
end
