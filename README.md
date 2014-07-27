vala-app-template
=================

A basic template for creating Vala applications. 

### Project Setup:

1.
git clone git@github.com:pokedpeter/vala-app-template.git

2.
Remove the hidden .git directory

3.
Update the folder name (vala-app-template)
 
4.
Update the following first two lines in CMakeList.txt

    set (PROJECT_NAME vala-app-template)
    set (PROJECT_DESC "Description of your app.")

5.
Update AUTHORS with your name

6.
Update the GNU license header in src/App.vala with your details
and paste this header in all your source files.
    
    Copyright (C) <Year> <Your Name>

7.
Establish a new repository from the existing files:

    git init

6.
Execute the file go to build your application.


### Project Build

From the main directory, enter the following commands in order:

    mkdir build
    cd build
    cmake ..
    make

If there are no errors, the executable will be created in the build directory.

Run the executable:

    ./vala-app-template

If you make any changes to your CMakeLists.txt, like add a new file,
delete the build directory and build again using the above steps.
