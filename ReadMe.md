

 Housing APP

This Sinatra Project demostrated the users ability to have many apartment in different location and an apartment can only have one User or Owner through the CRUD and MVC Sinatra application.


Getting Started
 Hint: If you dont have  gitHub account, You will need to create one to use this App so it can be cloned. 
 

 > On GitHub, navigate to the main page of the repository.

Note: If the repository is empty, you can manually copy the repository page's URL from your browser and skip to step four.

> Under the repository name, click Clone or download.

Clone or download button
To clone the repository using HTTPS, under "Clone with HTTPS", click . To clone the repository using an SSH key, including a certificate issued by your organization's SSH certificate authority, click Use SSH, then click .

Clone URL button
Open Terminal.

Change the current working directory to the location where you want the cloned directory to be made.

Type git clone, and then paste the URL you copied in Step 2.

$ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
Press Enter. Your local clone will be created.

$ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
> Cloning into `Spoon-Knife`...
> remote: Counting objects: 10, done.
> remote: Compressing objects: 100% (8/8), done.
> remove: Total 10 (delta 1), reused 10 (delta 1)
> Unpacking objects: 100% (10/10), done.

  > Has_many and Belong_to  were used to indicate the relationships between the User, locations and the Aparaments
  > A user 

A user is able to create an account, sign up, sign in, and sign out of there account using validation through email, or Username and Password
Once logged in, a user has an ability to create, read, update and destroy the resource that belongs_to user. [A user can no delete another user aparmtent information]. Furthermore, A logged in User can  edit and delete only their own information - not information created by other users.
 Also, Validation was used to prevent  bad data will not  be persisted to the database.
