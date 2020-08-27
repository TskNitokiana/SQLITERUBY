require 'sqlite3'
database = SQLite3::Database.open 'data.db'
database.execute "CREATE TABLE IF NOT EXISTS student(id INTEGER PRIMARY KEY AUTOINCREMENT ,name TEXT, address TEXT, phone INT)"
#MENU 
puts "C.R.U.D.S"
puts "1 CREAT, 2 READ 3 UPDATE, 4 DELETE, 5 SEARCH"
menu = gets.to_i
case menu
when 1
    puts "entrer le nom"
    name = gets.to_s
    puts "entrer l'address"
    address = gets.to_s
    puts "entrer le numero" 
    phone = gets.to_i
    database.execute "INSERT  INTO student (name,address,phone) VALUES ('#{name}','#{address}',#{phone})"
    print database.execute "SELECT * FROM student WHERE name ='#{name}'"
    puts "Creat succefully"

when 2
    puts "Succefully"
    print database.execute "SELECT * FROM student"
when 3
    print database.execute "SELECT name FROM student"
    puts "vous voulez modifier qui:  " 
    change = gets.to_s
    verify = database.execute "SELECT name FROM student WHERE name = '#{change}'"
    if verify == change
        puts "entrer le nom"
        name = gets.to_s
        puts "entrer l'address"
        address = gets.to_s
        puts "entrer le numero" 
        phone = gets.to_i
        database.execute "UPDATE student SET name = '#{name}', address = '#{address}',phone = #{phone} WHERE name = '#{change}'"
        print database.execute "SELECT name FROM student WHERE name = '#{name}'"
        puts "Update Succefully"     
    else
        puts "nom introuvable"
    end
when 4
    print database.execute "SELECT name FROM student"
    puts "vous voulez supprimer qui:  " 
    delete = gets.to_s
    verify = database.execute "SELECT nom FROM student WHERE name = '#{delete}'"
    if verify == delete
        database.execute "DELETE FROM student WHERE name = '#{delete}'"
        puts "DELETE Succefully"
    else
        puts "nom introuvable"
    end
    
when 5
    puts "Rechercer un nom:  "
    search = gets.to_s
    verify = database.execute "SELECT nom FROM student WHERE name = '#{search}'"
    if verify == search
        puts database.execute "SELECT name FROM student WHERE name = '#{search}'"
        puts "Succefully" 
    else
        puts "nom introuvable"
    end
    
else
    puts "wrong commande"
end

#affichage 

=begin new_request = database.execute "INSERT INTO student (name,address,phone) VALUES ('rabe','tana',0326548)"
if request == new_request
    puts "erreur"
else
    return new_request
end    
=end
#print database.execute "SELECT * FROM student"
#database.execute "DELETE FROM student WHERE id = 1"

=begin
    
equire 'sqlite3'

#creation de la base de donnée contacts
db = SQLite3::Database.open 'dataContact.db'

#Creation de la table contacte
db.execute "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY AUTOINCREMENT,name text,adress text)"

#insertion data dans la table contacts

db.execute "INSERT INTO contacts (name,adress) VALUES ('lova','avaratsena' )"
db.execute "INSERT INTO contacts (name,adress) VALUES ('sitraka','nanisana' )"
db.execute "INSERT INTO contacts (name,adress) VALUES ('lanto','mahamasina' )"
db.execute "INSERT INTO contacts (name,adress) VALUES ('setra','analakely' )"

#recuperation de tout les contacts enregistrer
puts "recuperation de tt les contacts enregister"
selectAll = db.execute "SELECT * FROM contacts"
print selectAll
puts "\n========================================================"
#modification du contact avec id = 2
puts "modification du contacts avec id = 2"
db.execute "UPDATE contacts SET name = 'test', adress = 'tanjobato' WHERE id = 2"
#recuperation de tout les contact enregistrer 
selectAll = db.execute "SELECT * FROM contacts"
print selectAll
puts "\n======================================================="
#suppression du contact avec  id = 4
puts "suppression du contact avec  id = 4"
db.execute "DELETE FROM contacts WHERE id=4"
#recuperation de tout les contact enregistrer 
selectAll = db.execute "SELECT * FROM contacts"
print selectAll
puts ""
    
end
=end