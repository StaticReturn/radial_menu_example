# Radial Menu Example

A small Flutter project to share a radial menu I created.

## Navigation

Long press anywhere on the screen and a circular menu will pop up.  Continue to press while moving around the various options.  When you are happy with your selection end your press and you will navigate to the chosen page.

<img src="https://user-images.githubusercontent.com/4959612/221069449-7cd29ecc-47fc-494a-a870-750c77218b90.gif" width=20% height=20%>

## Getting Started
### 1. Initialize

Create a list of PageOption instances.  Each instance should have:
* name - The text shown in the middle of the navigation circle.
* iconData - The icon to represent the target page.
* child - The new page to navigate to.

### 2. Listen
When a new page option is selected, *NavigationRadial* will call *onSelected* that will pass a *String* containing the name of the selection.  Here you can trigger a notifier.

### 3. Update the page
I use an *AnimatedSwitcher* widget to listen to page updates and then swap to the request page.

## Customizing
### Diameter
*NavigationRadial()* has a parameter called *menuDiameter* that defaults to 256.0.
### Colors
Colors can be found in the data/app_theme.dart file.
### TextSytle of the center text
The TextStyle for the center text can be found in the data/app_theme.dart file.

## F.A.Q.
**Q**:  Why not create a package and publish it to pub.dev?

**A**:  I don't want to.

**A**:  Is there any type of usage license for this code?

**Q**:  It's CC BY 4.0.
