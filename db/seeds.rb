# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Instrument.create(name:"Violin" , image_icon: "violinbtn1.png" , hover_icon: "violinbtn2.png" )
Instrument.create(name:"Cello" , image_icon: "cellobtn1.png" , hover_icon: "cellobtn2.png" )
Instrument.create(name:"Clarinet" , image_icon: "clarinetbtn1.png" , hover_icon: "clarinetbtn2.png" )
Instrument.create(name:"Percussion" , image_icon: "percussionbtn1.png" , hover_icon: "percussionbtn2.png" )
Instrument.create(name:"Guitar" ,image_icon:  "guitarbtn1.png" ,hover_icon:  "guitarbtn2.png" )
Instrument.create(name:"Piano",image_icon:  "pianobtn1.png" , hover_icon: "pianobtn2.png" )
Instrument.create(name:"Saxophone", image_icon: "saxophonebtn1.png" , hover_icon: "saxophonebtn2.png" )
Instrument.create(name:"Trumpet", image_icon: "trumpetbtn1.png" , hover_icon: "trumpetbtn2.png" )
Instrument.create(name:"Trombone", image_icon: "trombonebtn1.png" , hover_icon: "trombonebtn2.png" )
Instrument.create(name:"French Horn", image_icon: "hornbtn1.png" , hover_icon: "hornbtn2.png" )
Instrument.create(name:"Banjo" , image_icon: "banjobtn1.png" , hover_icon: "banjobtn2.png" )
Instrument.create(name:"Harp" , image_icon: "harpbtn1.png" , hover_icon: "harpbtn2.png" )
Instrument.create(name:"Voice" , image_icon: "voicebtn1.png" , hover_icon: "voicebtn2.png" )
Instrument.create(name:"Conducting" , image_icon: "conductingbtn1.png" , hover_icon: "conductingbtn2.png" )


Proficiency.create(level: "low")
Proficiency.create(level: "high")
Proficiency.create(level: "medium")
