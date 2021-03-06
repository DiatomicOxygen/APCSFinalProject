# APCSFinalProject

Google Docs: https://docs.google.com/document/d/1Zdl9EMhZwbXgUkS3egtWOTrf8F0gEfJEcs6PciEzm7Y/edit?usp=sharing

Group Name: OverProcessed
Group Members: Edward Oo, Jesse Xie

Brief Project Description:
We plan on making a 2D, simplified version of the high paced cooking game, Overcooked. In this game, we want to make it so that the player is able to control a chef that can perform various tasks and prepare dishes to be submitted for points. After a set amount of time, the player is rated on the amount of dishes prepared and the efficiency in which they did so.

How to play:
Run the code in processing and the game will start. Press space to leave the main menu. In the level select screen, press on your desired settings with the mouse and press space when satisfied. There is a timer at the top right of the screen, and when that is over, the level is over. There is a score counter to the left of the timer, which displays your score. On the left corner, there is a list of orders that you can submit for more points. The time remaining on the order influences the amount of points gained when the dish is submitted. You are controlling the chef, which is the blue circle with a white hat. Use the W, A, S, and D keys to move in their respective directions. Use the E key to pick up any items that are on the floor or on tiles or drop items. Use the Q key to interact with tiles that change ingredients or dispense ingredients (excluding the plate dispenser). Use the R key to switch to the other chef. To submit, just drop your plate onto the counter (white rectangular tile with arrows). Note that only plates can be submitted. Have fun!

Summary of How to Play:
Controls:
- WASD for movement
- space for a small speed boost
- E to pick up or drop an item
- Q to interact with special tiles (crates, cutting board, and sink) or a fire extinguisher
- R to switch which chef you control
- grave key to end current level
- mouse controls on level select screen

Level settings:
- click on level 1 or 2 with your mouse on the level select screen
  - level 2 is a bit harder
- click on hard mode button with your mouse to toggle hard mode
- press space to begin level

Food Guide:
- cabbages must be cut before put on a plate
- tomatoes must be cut before put on a plate
- meat must be cut and then cooked before put on a plate
- buns can be put on the plate straight out of the crate!

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
- Altered methods to interact with the Ingredient class better

Edward:
- reward method added for Order
- Order method revamped to have a Container variable rather than extending container (for display purposes)
- Changed equals method in Container class to not care about the order in which the ingredients are put onto the plate
  - Item class now has equals method (to fix issues with calling equals method from subclasses)
- Counter class added with modified putOn method
- Score added in main class
- Fixed collision with 8 directional movement (removed collision with corners of tiles)
- Added a knife to CuttingBoard

5/31/21
Edward:
- fixed a bug with picking up Items near a Tile
- added a dashing/speed boost mechanic for the player
  - keybinded to spacebar
- moved player waiting logic into Player class (for easier implmentation in future ProcessingTiles)

Jesse:
- Added waiting time for cutting action
- Added progress bar for cutting


6/2/21
Jesse:
- Added ability to control 2 cooks by switching between them with 'r'
- Added collision between players, edited visuals of cooks a bit
- Map changes

Edward:
- added easyMode in Counter so that dirty_plates are not returned
- Sink class added (converts dirty plates to plates with player interaction)
- fixed a bug where the player could not pick up items near empty tiles
- tomato crate added and tomato added to orders
- game states added in different display methods
  - split into gameOverDisplay and inGameDisplay
  - created gameOverDisplay

6/3/21
Edward:
- Fixed a bug with orders being spammed at a certain time
- made difficulty a bit easier (orders every 21s instead of 18s)
- created UML V2 on google Docs
- created presentationDemo branch for presentation

Jesse:
- Added images for tomatoes and cabbages (on crate, uncut, cut, on plate)
- Fixed other bugs

6/4/21
Edward:
- made images for Ingredients, Containers, and Crates easier to implement
- adjusted Order to reward harder orders more

6/5/21
Edward:
- stove class created (to be used later)

6/6/21
Edward:
- pan class created
- container class updated to accept cooked foods from pans
- stove now displays progress cooking

6/7/21
Jesse:
- Added menu/start screen
- Added fancy logo for menu/start screen

6/9/21
Jesse:
- Edited order tab visuals
- Added coin/score icon

Edward:
- changed crate to properly make ingredients that can be cooked
- meat assets added
- naming convention changed for items in containers (for convenience)
- cooked foods can be transferred directly from pan to plate
- fixed a bug where raw meat could be cooked before cut

6/10/21
Edward:
- added fire extinguisher to put out fires
- added textures (fire, burnt food, buns, fire extinguisher)
- level select screen added
- implemented levels
  - added level 2 (map and orders)
- added a way to end the game early (grave key)
- adjusted difficulty and added hard mode
  - hard mode makes orders faster and harder
  - hard mode adds dirty dishes and washing plates
  - hard mode moves location of garbage can in level 2 to be more punishing
- added credits on main menu
- updated many textures and some of their names
- fixed a bug where you could cook an item twice
- fixed a bug where you could only cook once with a stove
- fixed a bug where the plate dispenser looked full after it was empty
- fixed a bug where player could take items from a burning stove
- fixed a bug where levels would overlap
  - also sorry I procrastinated a little, I had 2 APs, a math test, and 2 other projects!

Jesse:
- Added a visual when time is up
- Made changes to how score screen pops up
- Began working on new and improved score screen

6/11/21
Edward:
- made 3rd and final UML (on google docs)
  - added pan class to UML
  - moved private variables from Map into Main
  - renamed Map to MapGen
- updated level select screen
- fixed a bug where score is not cleared after a game
- fixed a bug where player could take items from far away
- decreased difficulty on map 2

6/12/21 
Jesse:
Didnt realize project was due yesterday
- Revamped score system
- Added tips and fails
- Finished score screen
