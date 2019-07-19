

This Sinatra Project demostrated the users ability to have many apartment in different location and an apartment can only have one User or Owner through the CRUD and MVC Sinatra application.
  > Has_many and Belong_to  were used to indicate the relationships between the User, locations and the Aparaments
  > A user 

A user is able to create an account, sign up, sign in, and sign out of there account using validation through email, or Username and Password
Once logged in, a user has an ability to create, read, update and destroy the resource that belongs_to user. [A user can no delete another user aparmtent information]. Furthermore, A logged in User can  edit and delete only their own information - not information created by other users.
 Also, Validation was used to prevent  bad data will not  be persisted to the database.
