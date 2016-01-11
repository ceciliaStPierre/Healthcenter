# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Usuarios
u1 = User.create(firstname: "Giselle", secondname: " ", father_lastname: "Font", mother_lastname: " ",  speciality: "Computacion", email: "giselle@niclabs.cl", password: "123123123", password_confirmation: "123123123", avatar: "http://www.ndturner.com/gracePlus/wp-content/uploads/2014/06/LisaSimpson5.gif", is_admin: true, program: "Desarrollo", sector: "Todos" )
u2 = User.create(firstname: "Cecilia", secondname: " ", father_lastname: "Saint-Pierre", mother_lastname: ".",  speciality: "Ingeniería", email: "csaintpierre@uc.cl", password: "123123123", password_confirmation: "123123123", avatar: "http://rotarymeansbusiness.com/wp-content/uploads/avatar-female.png", is_admin: true, program: "Administración", sector: "Todos"  )

