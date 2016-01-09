# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Usuarios
u1 = User.create(firstname: "Gis", secondname: " ", father_lastname: "Font", mother_lastname: " ", phone_number: 777777, speciality: "Computacion", email: "giselle@niclabs.cl", password: "123123123", password_confirmation: "123123123", avatar: "https://s-media-cache-ak0.pinimg.com/236x/23/10/37/23103793c616e7d8105ee74f53d143dd.jpg", is_admin: true, program: "Desarrollo", sector: "Todos" )
u2 = User.create(firstname: "Mauricio", secondname: "Ignacio", father_lastname: "Rodriguez", mother_lastname: "Peña", phone_number: 90000001, speciality: "Kinesiología", email: "mrodriguez@test.com", password: "123123123", password_confirmation: "123123123",avatar: "http://www.mdspecialists.ca/images/team/3-bth_no-avatar-female-doctor.png", is_admin: false, program: "Infantes", sector: "Amarillo" )
u3 = User.create(firstname: "Magdalena", secondname: "Denisse", father_lastname: "Alvarez", mother_lastname: "Concha", phone_number: 90000002, speciality: "Pediatria", email: "malvarez@test.com", password: "123123123", password_confirmation: "123123123", avatar: "http://www.mdspecialists.ca/images/team/3-bth_no-avatar-female-doctor.png", is_admin: false, program: "Adultos", sector: "Amarillo"  )
u4 = User.create(firstname: "Sofia", secondname: "Paz", father_lastname: "Campos", mother_lastname: "Parra", phone_number: 90000003, speciality: "Traumatología", email: "scampos@test.com", password: "123123123", password_confirmation: "123123123", avatar: "http://www.veryicon.com/icon/png/Object/Medical%20DaPino/Doctor%20Assistant.png", is_admin: false, program: "Infantes", sector: "Verde"  )
u5 = User.create(firstname: "Cecilia", secondname: ".", father_lastname: "Saint-Pierre", mother_lastname: ".", phone_number: 90000004, speciality: "Ingeniería", email: "csaintpierre@uc.cl", password: "123123123", password_confirmation: "123123123", avatar: "http://rotarymeansbusiness.com/wp-content/uploads/avatar-female.png", is_admin: true, program: "Administración", sector: "Todos"  )
u6 = User.create(firstname: "Andrea", secondname: " ", father_lastname: "Aguirre", mother_lastname: " ", phone_number: 90000004, speciality: "Radiología", email: "aaguirre@test.com", password: "123123123", password_confirmation: "123123123", avatar: "http://rotarymeansbusiness.com/wp-content/uploads/avatar-female.png", is_admin: true, program: "Adulto", sector: "Verde"  )


#Grupos familiares
g1 = FamilyGroup.create(family_name: "Perez-Díaz-Maipu")

#Pacientes
p1 = Patient.create(firstname: "Juan", secondname: "Pablo", father_lastname: "Perez", mother_lastname: "Díaz", born_date: "1975-11-25", sex: "Masculino", home_adress: "Una avenida 255", phone_number: 90000101, contact_number: 90000201)
p2 = Patient.create(firstname: "Daniela", secondname: "Rocio", father_lastname: "Perez", mother_lastname: "Muñoz", born_date: "2002-11-25", sex: "Femenino", home_adress: "Una avenida 255", phone_number: 90000101, contact_number: 90000201)

#Planes
pa1 = Plan.create(clinical_objective: "Dignostico del origen y un posible tratamiento del traumatismo del pie del paciente", family_summary: "Mejora de la dolencia en el pie de nuestro padre", risk_factor: "Bajo", state: "Abierto", user_id: 2, family_group_id: 1)

#Actividades
a1 = Activity.create(description: "Serie de examenes exhaustivos al pie del paciente", activity_type: "Clinico", deadline: "2014-01-31", plan_id: 1)
a2 = Activity.create(description: "Investigación de la hija del paciente por posibles problemas hereditarios", activity_type: "Familiar", deadline: "2014-01-27", plan_id: 1)

#Objectives
o1 = Objective.create(description: "Realizar examen 1", is_done: true)
o2 = Objective.create(description: "Realizar examen 2", is_done: false)
o3 = Objective.create(description: "Agendar visita", is_done: true)
o4 = Objective.create(description: "Realizar visita", is_done: true)
o5 = Objective.create(description: "Realizar un informe detallado", is_done: false)

#Asociaciones
fgp1 = FamilyGroupsPatient.create(family_group_id: g1.id, patient_id: p1.id)
fgp2 = FamilyGroupsPatient.create(family_group_id: g1.id, patient_id: p2.id)

#g1.patients << p1
#g1.patients << p2

au1 = ActivitiesUser.create(activity_id: a1.id, user_id: u3.id)
au2 = ActivitiesUser.create(activity_id: a2.id, user_id: u4.id)
au3 = ActivitiesUser.create(activity_id: a2.id, user_id: u6.id)
#a1.users << u3
#a2.users << u4
#a2.users << u6

a1.objectives << o1
a1.objectives << o2
a2.objectives << o3
a2.objectives << o4
a2.objectives << o5

