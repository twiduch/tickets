Ticket.delete_all

# create roles
Role.create([{name: 'staff'}, {name: 'admin'}])

# create statuses
Status.create([{name: 'Waiting for Staff Response'},
               {name: 'Waiting for Customer'},
               {name: 'On Hold'},
               {name: 'Cancelled'},
               {name: 'Completed'}])

# create initial users
User.create([{username: 'Andy', password: 'andyandy', first_name: 'Andy'},
             {username: 'Tom', password: 'tomtom', first_name: 'Tom'}])
User.find_by_username('tom').roles << Role.admin

Ticket.create({creator_name: 'Joel', creator_email: 'joel@rucko.ok', department: '4B',
               subject: 'Big problem', body: 'This is big issue'})
