# APCSFinalProject

Google Docs: https://docs.google.com/document/d/1Zdl9EMhZwbXgUkS3egtWOTrf8F0gEfJEcs6PciEzm7Y/edit?usp=sharing

Group Name: OverProcessed
Group Members: Edward Oo, Jesse Xie

Brief Project Description:
We plan on making a 2D, simplified version of the high paced cooking game, Overcooked. In this game, we want to make it so that the player is able to control a chef that can perform various tasks and prepare dishes to be submitted for points. After a set amount of time, the player is rated on the amount of dishes prepared and the efficiency in which they did so.

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

