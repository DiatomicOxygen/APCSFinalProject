# APCSFinalProject

Google Docs: https://docs.google.com/document/d/1Zdl9EMhZwbXgUkS3egtWOTrf8F0gEfJEcs6PciEzm7Y/edit?usp=sharing

Group Name: OverProcessed
Group Members: Edward Oo, Jesse Xie

Brief Project Description:
We plan on making a 2D, simplified version of the high paced cooking game, Overcooked. In this game, we want to make it so that the player is able to control a chef that can perform various tasks and prepare dishes to be submitted for points. After a set amount of time, the player is rated on the amount of dishes prepared and the efficiency in which they did so.

How to play:
Run the code in processing and the game will start. There is a timer at the top right of the screen, and when that is over, the game is over. There is a score counter to the left of the timer, which displays your score. On the left corner, there is a list of orders that you can submit for more points. The time remaining on the order influences the amount of points gained when the dish is submitted. You are controlling the chef, which is the blue circle with a white hat. Use the W, A, S, and D keys to move in their respective directions. Use the E key to pick up any items that are on the floor or on tiles or drop items. Use the Q key to interact with tiles that change ingredients or dispense ingredients (excluding the plate dispenser). To submit, just drop your plate onto the counter (white rectangular tile with arrows). Note that only plates can be submitted. Have fun!

Development Log:
5/24/21
Jesse:
- Initialized Tile class, variables in Tile class, and added the constructor along with the display and putOn method
- Extended Tile class into Wall class, made minor edits to main and item class
- Began working map for first level

Edward:
- Initialized Player and Item class
- Added display and constructor for both
- Added planned instance variables to both
- Added collide method for player

5/25/21
Jesse:
- Initialized crate class with variables and methods
- Edited map

Edward:
- created pickUpDrop method for Player
- edited a few other methods to meet requirements of pickUpDrop and future player methods

5/26/21
Edward:
- edited Crate class to extend ProcessingTiles class (for future convenience)
- made player interact method (for all ProcessingTiles)
- created ingredient and container classes

5/27/21
Edward:
- DishDispenser class added to create plates
  - could not use crate class to do so due to complications with inheritance (container could not use putOn() if it was assigned as an Item)
- Player pickUpDrop updated to be able to put ingredients onto plates

Jesse:
- Fixed bugs with player "teleporting" back during collision
- Fixed interactions with tiles and items

5/28/21
Edward:
- fixed some bugs with pickUpDrop
- Added garbage can
- made UI better

5/30/21
Jesse:
- Added eight directional movement (although with bugs)
- Smoothed out movement (no delay when changing directionO
- Added cuttingBoard class
- Fleshed out ingredient class and properties
- Added cut variant for cabbages
- Fixed other bugs

Edward:
- reward method added for Order
- Order method revamped to have a Container variable rather than extending container (for display purposes)
- Changed equals method in Container class to not care about the order in which the ingredients are put onto the plate
  - Item class now has equals method (to fix issues with calling equals method from subclasses)
- Counter class added with modified putOn method
- Score added in main class
- Fixed collision with 8 directional movement (removed collision with corners of tiles)
- Added a knife to CuttingBoard
