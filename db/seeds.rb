unless User.exists?(email: "yhy7799@gmail.com")
  User.create!(
    email: "yhy7799@gmail.com",
    password: "femwifu2389ry238rhfunef",
    password_confirmation: "femwifu2389ry238rhfunef",
    admin: true,
    status: "Active",
    name: 'Admin'
  )
  puts "Admin user created successfully."
else
  puts "Admin user already exists."
end

