# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Create User - START"
User.destroy_all
p "Destroy all user"
user = User.create! :email => 'ugel@kemenagsumteng.go.id', :password => 'ugel@kemenagsumteng.go.id', :password_confirmation => 'ugel@kemenagsumteng.go.id'
p "Create Konseptor Sekjen"
user = User.create! :email => 'ktu@kemenagsumteng.go.id', :password => 'ktu@kemenagsumteng.go.id', :password_confirmation => 'ktu@kemenagsumteng.go.id'
p "Create KTU"
user = User.create! :email => 'kepala@kemenagsumteng.go.id', :password => 'kepala@kemenagsumteng.go.id', :password_confirmation => 'kepala@kemenagsumteng.go.id'
p "Create Kepala Kantor"
p "Create User - END"