Photogallery.create(name: 'Hlavní stránka')

Region.create(name: 'vystavy-uvodni-text', content: 'a')
Region.create(name: 'vystavy-levy-sloupec', content: 'b')
Region.create(name: 'vystavy-pravy-sloupec', content: 'c')
Region.create(name: 'hlavni-stranka-uvodni-text', content: 'd')
Region.create(name: 'kontakt', content: 'e')
Region.create(name: 'kontakt-dalsi-text', content: 'e')
Region.create(name: 'paticka-spodni-text', content: 'f')

User.create(email:"admin@admin.com", password: "pass12345", password_confirmation: "pass12345", first_name: "admin", last_name: "admin", admin: true)