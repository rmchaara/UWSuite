Introduction
------------
UW Suite is the beginning of an iOS application that takes advantage of the open data available on api.uwaterloo.ca and presents it to University of Waterloo students who wish to access this data in a more presentable manner. The idea was initially hacked out at a hackathon and despite the definite work that is still needed, it spawned into what it is now. 

I would like to point out that this is the first project that I have gone full out on so bear with me if there are any issues you find with design. I am most likely on it and am constantly looking for ways to enhance performance, presentability and implementation.

Initially I wanted to just release something to the Appstore with the current state that it is in now, however I have decided to hold off from that until this application has a presentable user experience.

If any of you would like to contribute to this project, first look at the [Future Plans](#future-plans) section and submit a pull and I will be more than happy to look over it as soon as possible. I would also like to open the invite to people who would like to use my code and shape it towards creating their own project however I ask that you please reference my work. I realize that this is the internet so I'm taking a gamble here but be nice :)

Current State
------------
[![](http://i.imgur.com/o5FH2.jpg)](http://i.imgur.com/6hKDL.jpg)
<br/>
As of right now, the application created has 4 main views that are available to the user including a main screen. There are several improvements to this application that I would like to make. Some of the changes come from the categories I am about to list, but there are also other functionalities and views that I plan on adding later on as well. If you would like the full list of todo's check out my ToDo document.

### Main Screen ###
[![](http://i.imgur.com/xL6zc.jpg)](http://i.imgur.com/F0bWo.jpg)
<br/>
This screen is pretty self explanatory and will link directly to the features of the application upon clicking the icons.

### Buildings Locator ###
[![](http://i.imgur.com/VKu7l.jpg)](http://i.imgur.com/rgwCZ.jpg)
<br/>
The current state of the buildings locator is to give a list of all of the buildings on campus and allow users to choose which building they would like to locate on their built in google maps application.

### Exam Schedule ###
[![](http://i.imgur.com/ja2km.jpg)](http://i.imgur.com/VtqfM.jpg)
<br/>
The current state of the exam schedule portion of the UW Suite is that it will display the most recently available Exam schedule. 

### OMGUW ###
[![](http://i.imgur.com/uiXRl.jpg)](http://i.imgur.com/E9ZoC.jpg)
<br/>
OMGUW simply displays the latest posts from OMGUW including the date of the post.

### WatPark ###
[![](http://i.imgur.com/qyJrq.jpg)](http://i.imgur.com/UTPT2.jpg)
<br/>
WatPark gives a real time view of how many parking spots are still available and this view refreshes every minute.


Future Plans
------------
### Main Screen ###
Add options for:
- Events
- Course Information
- Food Services
- Professors & Staff Information

### Buildings Locator ###
In order to make the building locator interactive, I am planning on embedding google maps. The default location will begin at the heart of the University of Waterloo but upon entry it will direct the user to the proper location. <br/>
Another option is to simply add a search bar to the top of the list and set the information up to a data source to allow proper searching. 

### Exam Schedule ###
All users to search for a class and have the screen used for one course/section at a time rather than multiple at a time.

### OMGUW ###
Allow users to post to OMGUW and to user a better looking interface for the UITableViewCells

### WatPark ###
Thinking of possibly allowing user to navigate a 2D car into desired parking location in order to extract information. There is also more Parking information available that could be put to good use.
