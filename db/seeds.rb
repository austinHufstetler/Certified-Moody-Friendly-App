# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Business.delete_all
Business.create!(name: ' Cre8ive Zone',
  description:
    %{<p>
      Cre8ive zone was started to give kids access to hands-on and interactive learning. Not only are we nuts about kids and science, we also take FUN seriously.
      </p>},
   logo_url: open('app/assets/images/cr8ivezone.png'),  
   #image_url: 'dcbang.jpg',  
  address: '2606 Bemiss Rd, Valdosta, GA 31602')
# . . .

