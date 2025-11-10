-- =============================================
-- THE BINDING OF ISAAC FLASH - COMPLETE DATABASE
-- =============================================

CREATE DATABASE IF NOT EXISTS ISAK;
USE ISAK;

-- =============================================
-- TABLE CREATION
-- =============================================

CREATE TABLE `Sprite` (
  `sprite_ID` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `sprite_Path` varchar(255)
);

CREATE TABLE `Effect` (
  `effect_ID` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `item_Description` varchar(255) NOT NULL,
  `item_Modifier` float NOT NULL
);

CREATE TABLE `Item` (
  `item_ID` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `item_Name` varchar(255) NOT NULL,
  `descriptionShown` varchar(255) NOT NULL,
  `isActive` boolean NOT NULL,
  `specialItem` boolean NOT NULL,
  `sprite_ID` integer NOT NULL,
  `effect_ID` integer NOT NULL,
  `passiveItems` integer NOT NULL,
  FOREIGN KEY (`sprite_ID`) REFERENCES `Sprite` (`sprite_ID`),
  FOREIGN KEY (`effect_ID`) REFERENCES `Effect` (`effect_ID`)
);

CREATE TABLE `Inventory` (
  `inventory_ID` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE `Characters` (
  `character_ID` integer UNIQUE PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `character_Name` varchar(255) NOT NULL,
  `starting_Health` float NOT NULL,
  `speed` float NOT NULL,
  `dmg` float NOT NULL,
  `fire_rate` float NOT NULL,
  `attack_range` float NOT NULL,
  `activeItemSlot` boolean NOT NULL,
  `passiveItems` integer NOT NULL,
  `inventory_ID` integer NOT NULL,
  FOREIGN KEY (`inventory_ID`) REFERENCES `Inventory` (`inventory_ID`)
);

CREATE TABLE `Inventory_Item` (
  `inventory_ID` integer NOT NULL,
  `item_ID` integer NOT NULL,
  PRIMARY KEY (`inventory_ID`, `item_ID`),
  FOREIGN KEY (`inventory_ID`) REFERENCES `Inventory` (`inventory_ID`),
  FOREIGN KEY (`item_ID`) REFERENCES `Item` (`item_ID`)
);

CREATE TABLE `Inventory_Character` (
  `character_ID` integer NOT NULL,
  `inventory_ID` integer NOT NULL,
  PRIMARY KEY (`character_ID`, `inventory_ID`),
  FOREIGN KEY (`character_ID`) REFERENCES `Characters` (`character_ID`),
  FOREIGN KEY (`inventory_ID`) REFERENCES `Inventory` (`inventory_ID`)
);

-- =============================================
-- DATA INSERTION - SPRITES
-- =============================================

INSERT INTO `Sprite` (`sprite_Path`) VALUES
-- Items 1-50
('gfx/items/collectibles/sad_onion.png'),
('gfx/items/collectibles/inners_eye.png'),
('gfx/items/collectibles/spoon_bender.png'),
('gfx/items/collectibles/maxs_head.png'),
('gfx/items/collectibles/my_reflection.png'),
('gfx/items/collectibles/num_1.png'),
('gfx/items/collectibles/blood_of_martyr.png'),
('gfx/items/collectibles/brother_bobby.png'),
('gfx/items/collectibles/skatole.png'),
('gfx/items/collectibles/halo_of_flies.png'),
('gfx/items/collectibles/1up.png'),
('gfx/items/collectibles/magic_mushroom.png'),
('gfx/items/collectibles/the_virus.png'),
('gfx/items/collectibles/roid_rage.png'),
('gfx/items/collectibles/heart.png'),
('gfx/items/collectibles/raw_liver.png'),
('gfx/items/collectibles/skeleton_key.png'),
('gfx/items/collectibles/dollar.png'),
('gfx/items/collectibles/boom.png'),
('gfx/items/collectibles/transcendence.png'),
('gfx/items/collectibles/compass.png'),
('gfx/items/collectibles/lunch.png'),
('gfx/items/collectibles/dinner.png'),
('gfx/items/collectibles/dessert.png'),
('gfx/items/collectibles/breakfast.png'),
('gfx/items/collectibles/rotten_meat.png'),
('gfx/items/collectibles/wooden_spoon.png'),
('gfx/items/collectibles/belt.png'),
('gfx/items/collectibles/mom_underwear.png'),
('gfx/items/collectibles/mom_heels.png'),
('gfx/items/collectibles/mom_lipstick.png'),
('gfx/items/collectibles/wire_coat_hanger.png'),
('gfx/items/collectibles/bible.png'),
('gfx/items/collectibles/book_of_belial.png'),
('gfx/items/collectibles/necronomicon.png'),
('gfx/items/collectibles/poop.png'),
('gfx/items/collectibles/mr_boom.png'),
('gfx/items/collectibles/tammys_head.png'),
('gfx/items/collectibles/moms_bra.png'),
('gfx/items/collectibles/kamikaze.png'),
('gfx/items/collectibles/moms_pad.png'),
('gfx/items/collectibles/bobs_rotten_head.png'),
('gfx/items/collectibles/teleport.png'),
('gfx/items/collectibles/yum_heart.png'),
('gfx/items/collectibles/lucky_foot.png'),
('gfx/items/collectibles/doc_remote.png'),
('gfx/items/collectibles/cupids_arrow.png'),
('gfx/items/collectibles/shoop_da_whoop.png'),
('gfx/items/collectibles/steven.png'),
-- Items 51-100
('gfx/items/collectibles/pentagram.png'),
('gfx/items/collectibles/dr_fetus.png'),
('gfx/items/collectibles/magneto.png'),
('gfx/items/collectibles/treasure_map.png'),
('gfx/items/collectibles/moms_eye.png'),
('gfx/items/collectibles/lemon_mishap.png'),
('gfx/items/collectibles/distant_admiration.png'),
('gfx/items/collectibles/book_of_shadows.png'),
('gfx/items/collectibles/the_ladder.png'),
('gfx/items/collectibles/charm_of_vampire.png'),
('gfx/items/collectibles/the_battery.png'),
('gfx/items/collectibles/steam_sale.png'),
('gfx/items/collectibles/anarchist_cookbook.png'),
('gfx/items/collectibles/hourglass.png'),
('gfx/items/collectibles/sister_maggy.png'),
('gfx/items/collectibles/technology.png'),
('gfx/items/collectibles/chocolate_milk.png'),
('gfx/items/collectibles/growth_hormones.png'),
('gfx/items/collectibles/mini_mush.png'),
('gfx/items/collectibles/rosary.png'),
('gfx/items/collectibles/cube_of_meat.png'),
('gfx/items/collectibles/quarter.png'),
('gfx/items/collectibles/phd.png'),
('gfx/items/collectibles/xray_vision.png'),
('gfx/items/collectibles/my_little_unicorn.png'),
('gfx/items/collectibles/book_of_revelations.png'),
('gfx/items/collectibles/the_mark.png'),
('gfx/items/collectibles/the_pact.png'),
('gfx/items/collectibles/dead_cat.png'),
('gfx/items/collectibles/lord_of_pit.png'),
('gfx/items/collectibles/the_nail.png'),
('gfx/items/collectibles/we_need_to_go_deeper.png'),
('gfx/items/collectibles/deck_of_cards.png'),
('gfx/items/collectibles/monstros_tooth.png'),
('gfx/items/collectibles/lokis_horns.png'),
('gfx/items/collectibles/little_chubby.png'),
('gfx/items/collectibles/spider_bite.png'),
('gfx/items/collectibles/the_small_rock.png'),
('gfx/items/collectibles/spelunker_hat.png'),
('gfx/items/collectibles/super_bandage.png'),
('gfx/items/collectibles/the_gamekid.png'),
('gfx/items/collectibles/sack_of_pennies.png'),
('gfx/items/collectibles/robo_baby.png'),
('gfx/items/collectibles/little_chad.png'),
('gfx/items/collectibles/the_book_of_sin.png'),
('gfx/items/collectibles/the_relic.png'),
('gfx/items/collectibles/little_gish.png'),
('gfx/items/collectibles/little_steven.png'),
('gfx/items/collectibles/the_halo.png'),
('gfx/items/collectibles/moms_bottle_pills.png');

-- =============================================
-- DATA INSERTION - EFFECTS
-- =============================================

INSERT INTO `Effect` (`item_Description`, `item_Modifier`) VALUES
-- Effects for items 1-50
('Tears up', 1.5),
('Triple shot', 3.0),
('Homing shots', 2.0),
('Damage up', 2.0),
('Boomerang tears', 1.8),
('Tears way up', 2.5),
('Damage up', 2.0),
('Familiar - Brother Bobby', 1.0),
('Enemies become friendly', 3.0),
('Fly orbital', 2.0),
('Extra life', 9.0),
('All stats up', 2.0),
('Poison touch', 2.5),
('Speed and range up', 1.7),
('Health up', 1.0),
('Full health + health up', 3.0),
('99 keys', 1.5),
('99 coins', 1.5),
('10 bombs', 1.5),
('Flight', 2.5),
('Reveal map', 2.0),
('Health up', 1.0),
('Health up', 1.0),
('Health up', 1.0),
('Health up', 1.0),
('Health up', 1.0),
('Speed up', 1.2),
('Speed up', 1.2),
('Range up', 1.3),
('Range up', 1.3),
('Range up', 1.3),
('Tears up', 1.5),
('Temporary flight', 2.0),
('Temporary damage up', 2.0),
('Room damage', 4.0),
('Place poop', 1.0),
('Place bomb', 2.0),
('Circular tear burst', 3.5),
('Freeze enemies', 2.5),
('Explosion damage', 3.0),
('Fear enemies', 2.2),
('Poison bomb', 2.8),
('Random teleport', 1.8),
('Heal one heart', 2.0),
('Luck up', 1.7),
('Air strike', 3.0),
('Piercing shots', 2.7),
('Brimstone laser', 5.0),
('Damage up', 2.0),
-- Effects for items 51-100
('Damage up + devil chance', 2.0),
('Bomb tears', 3.5),
('Attract pickups', 2.0),
('Reveal map', 2.0),
('Backwards tears', 1.8),
('Creep pool', 2.5),
('Orbital familiar', 2.0),
('Temporary invincibility', 4.0),
('Cross gaps', 1.5),
('Heal on kills', 2.2),
('Spawn battery', 1.8),
('Shop discount', 2.5),
('Spawn troll bombs', 2.8),
('Slow enemies', 2.2),
('Familiar - Sister Maggy', 1.0),
('Laser tears', 3.5),
('Charged shot', 4.0),
('Damage and speed up', 2.3),
('Speed up, range down', 1.8),
('Soul hearts + bible', 2.0),
('Meat boy familiar', 2.5),
('+25 coins', 1.5),
('Positive pills', 2.0),
('Reveal secret rooms', 2.2),
('Temporary invincibility', 3.5),
('Soul heart + horseman', 2.8),
('Damage and speed up', 2.4),
('Damage and soul hearts', 2.6),
('Nine lives', 9.0),
('Flight and speed up', 3.0),
('Soul heart + rock destroy', 2.7),
('Skip floor', 3.2),
('Random card', 2.1),
('Monstro attack', 3.0),
('Multi-direction shot', 2.9),
('Charging familiar', 2.8),
('Slow enemies', 2.3),
('Damage and tears up', 2.7),
('Reveal map', 2.1),
('Health and speed up', 2.4),
('Pac-man mode', 3.5),
('Penny generator', 1.8),
('Laser familiar', 2.6),
('Heart generator', 2.2),
('Spawn pickups', 2.3),
('Soul heart generator', 2.4),
('Slowing tears familiar', 2.5),
('Homing tears familiar', 2.7),
('All stats up', 2.8),
('Random pill', 2.1);

-- =============================================
-- DATA INSERTION - ITEMS (1-100)
-- =============================================

-- Items 1-50 (Correctly ordered from Flash version)
INSERT INTO `Item` (`item_Name`, `descriptionShown`, `isActive`, `specialItem`, `sprite_ID`, `effect_ID`, `passiveItems`) VALUES
('The Sad Onion', 'Tears up', 0, 1, 1, 1, 1),
('The Inner Eye', 'Triple shot', 0, 1, 2, 2, 1),
('Spoon Bender', 'Homing shots', 0, 1, 3, 3, 1),
('Max''s Head', 'DMG up', 0, 1, 4, 4, 1),
('My Reflection', 'Boomerang tears', 0, 1, 5, 5, 1),
('Number One', 'Tears up', 0, 1, 6, 6, 1),
('Blood of the Martyr', 'DMG up', 0, 1, 7, 7, 1),
('Brother Bobby', 'Friends till the end', 0, 1, 8, 8, 1),
('Skatole', 'Fly love', 0, 0, 9, 9, 1),
('Halo of Flies', 'Projectile protection', 0, 0, 10, 10, 1),
('1UP', 'Extra life', 0, 0, 11, 11, 1),
('Magic Mushroom', 'All stats up!', 0, 1, 12, 12, 1),
('The Virus', 'Poison touch', 0, 0, 13, 13, 1),
('Roid Rage', 'Speed and range up', 0, 0, 14, 14, 1),
('<3', 'HP up', 0, 0, 15, 15, 1),
('Raw Liver', 'HP up', 0, 1, 16, 16, 1),
('Skeleton Key', '99 keys', 0, 0, 17, 17, 1),
('A Dollar', '$$$', 0, 0, 18, 18, 1),
('Boom!', '10 bombs', 0, 0, 19, 19, 1),
('Transcendence', 'We all float down here...', 0, 0, 20, 20, 1),
('The Compass', 'The end is near', 0, 0, 21, 21, 1),
('Lunch', 'HP up', 0, 0, 22, 22, 1),
('Dinner', 'HP up', 0, 0, 23, 23, 1),
('Dessert', 'HP up', 0, 0, 24, 24, 1),
('Breakfast', 'HP up', 0, 0, 25, 25, 1),
('Rotten Meat', 'HP up', 0, 0, 26, 26, 1),
('Wooden Spoon', 'Speed up', 0, 0, 27, 27, 1),
('The Belt', 'Speed up', 0, 0, 28, 28, 1),
('Mom''s Underwear', 'Range up', 0, 0, 29, 29, 1),
('Mom''s Heels', 'Range up', 0, 0, 30, 30, 1),
('Mom''s Lipstick', 'Range up', 0, 0, 31, 31, 1),
('Wire Coat Hanger', 'Tears up', 0, 0, 32, 32, 1),
('The Bible', 'Temporary flight', 1, 0, 33, 33, 0),
('The Book of Belial', 'Temporary DMG up', 1, 0, 34, 34, 0),
('The Necronomicon', 'Mass enemy damage', 1, 0, 35, 35, 0),
('The Poop', 'Place a poop', 1, 0, 36, 36, 0),
('Mr. Boom', 'Reusable bomb', 1, 0, 37, 37, 0),
('Tammy''s Head', 'Reusable tear burst', 1, 0, 38, 38, 0),
('Mom''s Bra', 'Mass paralysis', 1, 0, 39, 39, 0),
('Kamikaze!', 'Become the bomb!', 1, 0, 40, 40, 0),
('Mom''s Pad', 'Mass fear', 1, 0, 41, 41, 0),
('Bob''s Rotten Head', 'Reusable poison bomb', 1, 0, 42, 42, 0),
('Teleport!', 'Teleport', 1, 0, 43, 43, 0),
('Yum Heart', 'Reusable healing', 1, 0, 44, 44, 0),
('Lucky Foot', 'Luck up', 0, 0, 45, 45, 1),
('Doctor''s Remote', 'Reusable air strike', 1, 0, 46, 46, 0),
('Cupid''s Arrow', 'Piercing shots', 0, 0, 47, 47, 1),
('Shoop Da Whoop!', 'Brimstone laser', 1, 0, 48, 48, 0),
('Steven', 'DMG up', 0, 1, 49, 49, 1);

-- Items 51-100 (Continuing from Flash version)
INSERT INTO `Item` (`item_Name`, `descriptionShown`, `isActive`, `specialItem`, `sprite_ID`, `effect_ID`, `passiveItems`) VALUES
('Pentagram', 'DMG up', 0, 1, 50, 50, 1),
('Dr. Fetus', 'Bomb tears', 0, 1, 51, 51, 1),
('Magneto', 'Attract pickups', 0, 0, 52, 52, 1),
('Treasure Map', 'Full map', 0, 0, 53, 53, 1),
('Mom''s Eye', 'Shot backwards', 0, 0, 54, 54, 1),
('Lemon Mishap', 'Creep pool', 1, 0, 55, 55, 0),
('Distant Admiration', 'Forever alone.', 0, 0, 56, 56, 1),
('Book of Shadows', 'Temporary invincibility', 1, 0, 57, 57, 0),
('The Ladder', 'Bridget the gap!', 0, 0, 58, 58, 1),
('Charm of the Vampire', 'Heals half a heart every 13 kills', 0, 0, 59, 59, 1),
('The Battery', 'Stores energy', 0, 0, 60, 60, 1),
('Steam Sale', '50% off', 0, 0, 61, 61, 1),
('Anarchist Cookbook', 'Summon troll bombs', 1, 0, 62, 62, 0),
('The Hourglass', 'Slow', 1, 0, 63, 63, 0),
('Sister Maggy', 'Shot buddy', 0, 0, 64, 64, 1),
('Technology', 'Laser tears', 0, 1, 65, 65, 1),
('Chocolate Milk', 'Charge shot', 0, 1, 66, 66, 1),
('Growth Hormones', 'DMG + speed up', 0, 0, 67, 67, 1),
('Mini Mush', 'Speed up', 0, 0, 68, 68, 1),
('Rosary', 'Soul hearts + bible', 0, 0, 69, 69, 1),
('Cube of Meat', 'Meat boy level 1', 0, 0, 70, 70, 1),
('A Quarter', '+25 coins', 0, 0, 71, 71, 1),
('PHD', 'Positive pills', 0, 0, 72, 72, 1),
('X-Ray Vision', 'See through doors', 0, 0, 73, 73, 1),
('My Little Unicorn', 'Temporary invincibility', 1, 0, 74, 74, 0),
('Book of Revelations', 'Soul heart + horseman', 1, 0, 75, 75, 0),
('The Mark', 'DMG + speed up', 0, 0, 76, 76, 1),
('The Pact', 'DMG + soul hearts', 0, 0, 77, 77, 1),
('Dead Cat', 'Nine lives', 0, 1, 78, 78, 1),
('Lord of the Pit', 'Flight + speed', 0, 1, 79, 79, 1),
('The Nail', 'Soul heart + destroy rocks', 0, 0, 80, 80, 1),
('We Need To Go Deeper!', 'Skip floor', 1, 0, 81, 81, 0),
('Deck of Cards', 'Random card', 1, 0, 82, 82, 0),
('Monstro''s Tooth', 'Monstro attack', 1, 0, 83, 83, 0),
('Loki''s Horns', 'Multi-direction shot', 0, 0, 84, 84, 1),
('Little Chubby', 'Charging familiar', 0, 0, 85, 85, 1),
('Spider Bite', 'Slow enemies', 0, 0, 86, 86, 1),
('The Small Rock', 'DMG + tears up', 0, 1, 87, 87, 1),
('Spelunker Hat', 'Reveal map', 0, 0, 88, 88, 1),
('Super Bandage', 'Health + speed up', 0, 0, 89, 89, 1),
('The Gamekid', 'Pac-man mode', 1, 0, 90, 90, 0),
('Sack of Pennies', 'Penny generator', 0, 0, 91, 91, 1),
('Robo-Baby', 'Laser familiar', 0, 0, 92, 92, 1),
('Little C.H.A.D.', 'Heart generator', 0, 0, 93, 93, 1),
('The Book of Sin', 'Spawn pickups', 1, 0, 94, 94, 0),
('The Relic', 'Soul heart generator', 0, 0, 95, 95, 1),
('Little Gish', 'Slowing tears', 0, 0, 96, 96, 1),
('Little Steven', 'Homing tears', 0, 0, 97, 97, 1),
('The Halo', 'All stats up', 0, 0, 98, 98, 1),
('Mom''s Bottle of Pills', 'Random pill', 1, 0, 99, 99, 0);

-- =============================================
-- DATA INSERTION - CHARACTERS AND INVENTORIES
-- =============================================

-- Create base inventories
INSERT INTO `Inventory` (`inventory_ID`) VALUES (1), (2), (3), (4), (5), (6), (7);

-- Insert characters with correct starting items
INSERT INTO `Characters` (`character_Name`, `starting_Health`, `speed`, `dmg`, `fire_rate`, `attack_range`, `activeItemSlot`, `passiveItems`, `inventory_ID`) VALUES
('Isaac', 3.0, 1.0, 2.5, 1.0, 6.5, 1, 0, 1),
('Magdalene', 4.0, 0.9, 2.5, 1.0, 6.5, 1, 0, 2),
('Cain', 2.0, 1.1, 2.5, 1.0, 6.5, 1, 0, 3),
('Judas', 1.0, 1.0, 3.5, 1.0, 6.5, 1, 0, 4),
('???', 3.0, 1.0, 2.5, 1.0, 6.5, 1, 0, 5),
('Eve', 2.0, 1.0, 2.0, 1.0, 6.5, 1, 0, 6),
('Samson', 3.0, 1.0, 2.5, 1.0, 6.5, 1, 0, 7);

-- Assign canonical starting items to each character
INSERT INTO `Inventory_Item` (`inventory_ID`, `item_ID`) VALUES
-- Isaac: No starting items
(1, 1), -- The Sad Onion (example starting item)

-- Magdalene: Starts with Yum Heart (44)
(2, 44),

-- Cain: Starts with Lucky Foot (45)
(3, 45),

-- Judas: Starts with Book of Belial (34)
(4, 34),

-- ??? (Blue Baby): Starts with The Poop (36)
(5, 36),

-- Eve: Starts with Dead Bird (needs to be added) and Whore of Babylon
-- Using existing items as placeholders
(6, 12), -- Magic Mushroom (placeholder)
(6, 14),  -- Roid Rage (placeholder)

-- Samson: Starts with Bloody Lust (needs to be added)
(7, 4);   -- Max's Head (placeholder)

-- Link characters to their inventories
INSERT INTO `Inventory_Character` (`character_ID`, `inventory_ID`) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7);

-- =============================================
-- VERIFICATION QUERIES
-- =============================================

-- Verify characters
SELECT * FROM `Characters`;

-- Verify items count
SELECT COUNT(*) as 'Total Items' FROM `Item`;

-- Verify items 1-50
SELECT item_ID, item_Name, descriptionShown, isActive, specialItem 
FROM `Item` 
WHERE item_ID BETWEEN 1 AND 50 
ORDER BY item_ID;

-- Verify items 51-100
SELECT item_ID, item_Name, descriptionShown, isActive, specialItem 
FROM `Item` 
WHERE item_ID BETWEEN 51 AND 100 
ORDER BY item_ID;

-- Verify character inventories
SELECT c.character_Name, i.item_Name, i.descriptionShown
FROM Characters c
JOIN Inventory_Character ic ON c.character_ID = ic.character_ID
JOIN Inventory_Item ii ON ic.inventory_ID = ii.inventory_ID
JOIN Item i ON ii.item_ID = i.item_ID
ORDER BY c.character_Name;