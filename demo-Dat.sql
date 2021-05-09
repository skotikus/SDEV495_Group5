-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: ableit.asuscomm.com    Database: GRP5_scott
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `g5log`
--

DROP TABLE IF EXISTS `g5log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5log` (
  `log_id` int(5) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5log`
--

LOCK TABLES `g5log` WRITE;
/*!40000 ALTER TABLE `g5log` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` int(10) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_qty` int(6) NOT NULL,
  `item_loc` int(11) NOT NULL,
  `item_color` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_itmloc` (`item_loc`),
  CONSTRAINT `fk_itmloc` FOREIGN KEY (`item_loc`) REFERENCES `locations` (`loc_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (2,'Icecream - Dstk Cml And Fdg',637,4,'Purple'),(3,'Rum - Mount Gay Eclipes',513,5,'Khaki'),(4,'Chick Peas - Canned',519,3,'Fuscia'),(5,'Island Oasis - Raspberry',712,3,'Indigo'),(6,'Puff Pastry - Sheets',234,2,'Puce'),(7,'Magnotta Bel Paese Red',202,2,'Goldenrod'),(8,'Soup - Cream Of Potato / Leek',434,5,'Green'),(9,'Big Ass Corn',591,2,'Red'),(10,'Wine - Magnotta - Red, Baco',680,3,'Crimson'),(11,'Green Tea Refresher',572,3,'Pink'),(12,'Sproutsmustard Cress',991,2,'Teal'),(13,'Chocolate - Dark Callets',883,5,'Green'),(14,'Cheese - Brie, Cups 125g',176,5,'Red'),(15,'Soup - Campbells, Spinach Crm',578,2,'Violet'),(16,'Assorted Desserts',759,3,'Khaki'),(17,'Wiberg Cure',719,6,'Fuscia'),(18,'Cranberries - Fresh',349,3,'Purple'),(19,'Nori Sea Weed',517,4,'Crimson'),(20,'Curry Paste - Madras',692,3,'Fuscia'),(21,'Sprite, Diet - 355ml',680,4,'Turquoise'),(22,'Gin - Gilbeys London, Dry',499,5,'Goldenrod'),(23,'Glass Clear 8 Oz',461,4,'Maroon'),(24,'Cheese - Mascarpone',111,4,'Purple'),(25,'Wine - Shiraz Wolf Blass Premium',208,2,'Turquoise'),(26,'Cookies Almond Hazelnut',186,5,'Green'),(27,'Snapple Raspberry Tea',869,4,'Teal'),(28,'Soup - French Can Pea',790,4,'Violet'),(29,'Grand Marnier',807,4,'Teal'),(30,'Truffle Shells - Semi - Sweet',933,2,'Blue'),(31,'Wine - Chardonnay South',72,2,'Green'),(32,'Wine - Blue Nun Qualitatswein',156,2,'Pink'),(33,'Puff Pastry - Slab',387,4,'Indigo'),(34,'Bread - Italian Sesame Poly',603,4,'Maroon'),(35,'Ecolab - Power Fusion',486,2,'Pink'),(36,'Sauce - Salsa',21,5,'Crimson'),(37,'Soap - Mr.clean Floor Soap',131,1,'Purple'),(38,'Energy Drink',827,5,'Red'),(39,'Wine - Penfolds Koonuga Hill',641,4,'Mauv'),(40,'Lettuce - Baby Salad Greens',401,1,'Aquamarine'),(41,'Flower - Leather Leaf Fern',818,1,'Violet'),(42,'Madeira',921,4,'Goldenrod'),(43,'Salmon Atl.whole 8 - 10 Lb',999,2,'Fuscia'),(44,'Pate - Liver',615,5,'Green'),(45,'Ice Cream Bar - Rolo Cone',14,4,'Teal'),(46,'Sprouts - Alfalfa',118,1,'Indigo'),(47,'Pasta - Fett Alfredo, Single Serve',601,3,'Khaki'),(48,'Coke - Classic, 355 Ml',257,1,'Khaki'),(49,'Glass - Juice Clear 5oz 55005',787,4,'Mauv'),(50,'Huck Towels White',870,5,'Yellow'),(51,'Juice - Tomato, 48 Oz',286,4,'Turquoise'),(52,'Spice - Chili Powder Mexican',757,5,'Khaki'),(53,'Veal - Sweetbread',775,4,'Maroon'),(54,'Wine - Red, Mouton Cadet',789,2,'Yellow'),(55,'Bread - Olive Dinner Roll',875,3,'Orange'),(56,'Mushroom Morel Fresh',998,3,'Orange'),(57,'Ocean Spray - Ruby Red',644,4,'Aquamarine'),(58,'Mix - Cocktail Strawberry Daiquiri',930,3,'Violet'),(59,'Seedlings - Clamshell',566,4,'Green'),(60,'Chocolate - Milk, Callets',175,2,'Crimson'),(61,'Salmon - Canned',91,3,'Khaki'),(62,'Calypso - Lemonade',274,4,'Khaki'),(63,'Crackers - Water',572,1,'Blue'),(64,'Oysters - Smoked',152,3,'Aquamarine'),(65,'Appetizer - Cheese Bites',375,5,'Violet'),(66,'Cheese - Augre Des Champs',873,4,'Violet'),(67,'Rootbeer',77,2,'Turquoise'),(68,'Muffin Mix - Carrot',444,5,'Indigo'),(69,'Gatorade - Xfactor Berry',807,3,'Blue'),(70,'Tomato Puree',549,1,'Maroon'),(71,'Tarragon - Fresh',248,5,'Mauv'),(72,'Noodles - Steamed Chow Mein',91,3,'Maroon'),(73,'Chicken - Leg, Boneless',178,3,'Indigo'),(74,'Appetiser - Bought',90,4,'Pink'),(75,'Shopper Bag - S - 4',442,3,'Khaki'),(76,'Cup - Translucent 7 Oz Clear',930,4,'Khaki'),(77,'Container - Clear 16 Oz',482,3,'Violet'),(78,'Beef - Top Sirloin - Aaa',312,4,'Yellow'),(79,'Pepper - Orange',294,2,'Green'),(80,'Gin - Gilbeys London, Dry',946,3,'Orange'),(81,'Nantucket - Carrot Orange',888,1,'Khaki'),(82,'Fork - Plastic',742,3,'Mauv'),(83,'Parsley - Dried',222,2,'Teal'),(84,'Evaporated Milk - Skim',800,5,'Indigo'),(85,'Garlic',207,3,'Mauv'),(86,'Shark - Loin',110,2,'Orange'),(87,'Wine - Valpolicella Masi',251,4,'Green'),(88,'Lighter - Bbq',792,3,'Violet'),(89,'Compound - Strawberry',956,1,'Yellow'),(90,'V8 Pet',844,5,'Yellow'),(91,'Yogurt - Cherry, 175 Gr',995,2,'Puce'),(92,'Irish Cream - Butterscotch',799,4,'Mauv'),(93,'Coffee - Cafe Moreno',990,3,'Teal'),(94,'Pasta - Fettuccine, Egg, Fresh',778,4,'Blue'),(95,'Huck Towels White',635,5,'Orange'),(96,'Garlic - Peeled',131,1,'Puce'),(97,'Chocolate - Unsweetened',801,3,'Indigo'),(98,'Onions - Spanish',455,4,'Maroon'),(99,'Venison - Ground',895,3,'Goldenrod'),(100,'Bread - Frozen Basket Variety',969,2,'Teal'),(101,'Wine - Ruffino Chianti Classico',808,4,'Khaki'),(102,'Basil - Dry, Rubbed',324,3,'Violet'),(103,'Cup Translucent 9 Oz',389,4,'Violet'),(104,'Puree - Strawberry',132,1,'Turquoise'),(105,'Sauce - Chili',496,5,'Fuscia'),(106,'Pastry - Key Limepoppy Seed Tea',326,1,'Yellow'),(107,'Wine - Red, Cabernet Sauvignon',549,4,'Puce'),(108,'Muffin - Carrot Individual Wrap',206,1,'Aquamarine'),(109,'Snapple - Iced Tea Peach',806,4,'Goldenrod'),(110,'Veal - Slab Bacon',983,5,'Red'),(111,'Chips Potato Salt Vinegar 43g',484,2,'Fuscia'),(112,'Basil - Fresh',130,1,'Yellow'),(113,'Sugar - Brown',716,1,'Violet'),(114,'Table Cloth 62x120 Colour',360,5,'Blue'),(115,'Champagne - Brights, Dry',479,5,'Crimson'),(116,'Pasta - Linguini, Dry',227,4,'Green'),(117,'Beer - Original Organic Lager',144,1,'Red'),(118,'Cheese - Havarti, Salsa',321,2,'Mauv'),(119,'Cookie Dough - Double',61,3,'Maroon'),(120,'Chick Peas - Canned',722,1,'Teal'),(121,'Coffee - Dark Roast',785,4,'Purple'),(122,'Raisin - Dark',143,4,'Yellow'),(123,'Coffee - Decaffeinato Coffee',864,2,'Violet'),(124,'Salmon Steak - Cohoe 6 Oz',724,5,'Maroon'),(125,'Soup - Campbells Chili',604,3,'Violet'),(126,'Oxtail - Cut',146,2,'Maroon'),(127,'Vinegar - Raspberry',844,2,'Purple'),(128,'Wine - Puligny Montrachet A.',715,1,'Teal'),(129,'Flour - Bread',330,5,'Blue'),(130,'Kiwano',955,4,'Orange'),(131,'Mushroom - Chanterelle, Dry',268,1,'Orange'),(132,'Creme De Cacao White',805,1,'Fuscia'),(133,'Beans - Black Bean, Preserved',343,5,'Turquoise'),(134,'Juice - Cranberry, 341 Ml',339,2,'Crimson'),(135,'Gloves - Goldtouch Disposable',589,4,'Fuscia'),(136,'Sauce - Alfredo',291,4,'Purple'),(137,'Pastrami',751,2,'Fuscia'),(138,'Breadfruit',646,3,'Turquoise'),(139,'Vector Energy Bar',268,3,'Green'),(140,'Beef - Chuck, Boneless',618,1,'Violet'),(141,'Squid - Breaded',344,5,'Khaki'),(142,'Cheese - Cream Cheese',53,5,'Khaki'),(143,'Cake - Cake Sheet Macaroon',573,3,'Orange'),(144,'Ice Cream - Life Savers',245,2,'Pink'),(145,'Aspic - Amber',434,2,'Orange'),(146,'Crab - Blue, Frozen',948,5,'Blue'),(147,'Food Colouring - Pink',13,1,'Yellow'),(148,'Cup Translucent 9 Oz',939,4,'Blue'),(149,'Wine - Cava Aria Estate Brut',1000,1,'Orange'),(150,'Rosemary - Fresh',312,3,'Indigo'),(151,'Table Cloth 120 Round White',284,3,'Fuscia'),(152,'Jello - Assorted',381,1,'Purple'),(153,'Puff Pastry - Sheets',766,5,'Red'),(154,'Swiss Chard - Red',149,1,'Orange'),(155,'Beer - Alexander Kieths, Pale Ale',937,1,'Fuscia'),(156,'Beer - Pilsner Urquell',771,3,'Violet'),(157,'Wine - Vidal Icewine Magnotta',641,4,'Crimson'),(158,'Chocolate - Dark Callets',170,4,'Purple'),(159,'Spinach - Baby',232,1,'Red'),(160,'Rice Paper',190,2,'Green'),(161,'Milk - Chocolate 250 Ml',951,1,'Mauv'),(162,'Yucca',757,1,'Yellow'),(163,'Apples - Spartan',418,4,'Blue'),(164,'Nut - Pecan, Halves',754,5,'Turquoise'),(165,'Beef - Ox Tongue, Pickled',311,2,'Indigo'),(166,'Soup - Knorr, French Onion',282,3,'Khaki'),(167,'Asparagus - White, Canned',676,4,'Teal'),(168,'Mayonnaise - Individual Pkg',81,1,'Puce'),(169,'Momiji Oroshi Chili Sauce',521,5,'Crimson'),(170,'Napkin - Dinner, White',280,1,'Violet'),(171,'Onions - Vidalia',351,1,'Red'),(172,'Veal - Osso Bucco',90,3,'Crimson'),(173,'Vaccum Bag - 14x20',530,5,'Fuscia'),(174,'Wine - Fontanafredda Barolo',660,4,'Goldenrod'),(175,'Nut - Pecan, Pieces',42,4,'Purple'),(176,'Grapefruit - Pink',82,2,'Violet'),(177,'Dried Cherries',593,2,'Crimson'),(178,'Tomatoes Tear Drop Yellow',940,4,'Green'),(179,'Cookie Dough - Peanut Butter',319,2,'Aquamarine'),(180,'Appetizer - Tarragon Chicken',952,5,'Khaki'),(181,'Trout - Hot Smkd, Dbl Fillet',212,2,'Mauv'),(182,'Wine - White Cab Sauv.on',655,5,'Pink'),(183,'Cheese - Woolwich Goat, Log',413,4,'Puce'),(184,'Muffin Chocolate Individual Wrap',532,1,'Puce'),(185,'Wine - White, Mosel Gold',649,1,'Goldenrod'),(186,'Oil - Sesame',149,3,'Orange'),(187,'Lettuce - Lolla Rosa',95,3,'Crimson'),(188,'Yeast - Fresh, Fleischman',680,3,'Teal'),(189,'Artichokes - Jerusalem',302,5,'Khaki'),(190,'Mint - Fresh',111,5,'Blue'),(191,'Wine - Magnotta - Belpaese',72,4,'Khaki'),(192,'Cheese - Parmigiano Reggiano',942,5,'Violet'),(193,'Pastry - Chocolate Chip Muffin',812,2,'Puce'),(194,'Bouq All Italian - Primerba',240,3,'Puce'),(195,'Sauce - Demi Glace',577,1,'Yellow'),(196,'Yeast Dry - Fleischman',204,5,'Pink'),(197,'Magnotta - Bel Paese White',228,3,'Aquamarine'),(198,'Sausage - Meat',393,5,'Aquamarine'),(199,'Soup - Campbells, Beef Barley',163,1,'Pink'),(200,'Pasta - Canelloni, Single Serve',308,1,'Blue'),(201,'Cookie - Dough Variety',487,3,'Puce'),(202,'Shrimp - Black Tiger 8 - 12',633,2,'Turquoise'),(203,'Chicken - Whole Roasting',431,5,'Orange'),(204,'Table Cloth 81x81 Colour',793,5,'Goldenrod'),(205,'Sauce - Hp',533,4,'Crimson'),(206,'Nut - Almond, Blanched, Ground',518,5,'Mauv'),(207,'Magnotta - Bel Paese White',917,1,'Crimson'),(208,'Cheese - Cheddar, Mild',834,3,'Goldenrod'),(209,'Longos - Assorted Sandwich',119,4,'Maroon'),(210,'Versatainer Nc - 888',386,2,'Yellow'),(211,'Tart - Raisin And Pecan',51,4,'Puce'),(212,'Carbonated Water - Peach',473,3,'Crimson'),(213,'Tomato - Green',299,2,'Turquoise'),(214,'Bread Base - Gold Formel',593,3,'Pink'),(215,'Onions - White',497,4,'Yellow'),(216,'Water - Aquafina Vitamin',137,3,'Blue'),(217,'Muffin Mix - Raisin Bran',261,5,'Purple'),(218,'Table Cloth 72x144 White',838,2,'Red'),(219,'Mini - Vol Au Vents',214,2,'Turquoise'),(220,'Green Tea Refresher',775,5,'Orange'),(221,'Cod - Fillets',604,3,'Red'),(222,'Bread - White Mini Epi',535,5,'Purple'),(223,'Tomatillo',73,3,'Violet'),(224,'Gingerale - Diet - Schweppes',575,4,'Maroon'),(225,'Appetizer - Mango Chevre',861,2,'Green'),(226,'Lettuce - Belgian Endive',917,3,'Khaki'),(227,'Flax Seed',683,2,'Green'),(228,'Cranberries - Dry',193,3,'Red'),(229,'Sauce - Demi Glace',455,3,'Khaki'),(230,'Wine - Saint - Bris 2002, Sauv',567,1,'Khaki'),(231,'Beef - Rib Roast, Cap On',229,2,'Turquoise'),(232,'Bagel - Everything Presliced',370,3,'Goldenrod'),(233,'Milk - Homo',513,3,'Orange'),(234,'Foam Tray S2',604,4,'Blue'),(235,'The Pop Shoppe - Cream Soda',360,3,'Maroon'),(236,'Sea Bass - Fillets',292,2,'Pink'),(237,'Bread - Pumpernickel',839,4,'Turquoise'),(238,'Tart Shells - Sweet, 3',571,3,'Khaki'),(239,'Cinnamon - Stick',715,2,'Turquoise'),(240,'Wine - White, Ej Gallo',152,3,'Turquoise'),(241,'Bread Base - Gold Formel',367,1,'Blue'),(242,'Broom - Angled',925,2,'Goldenrod'),(243,'Milk - Homo',580,4,'Khaki'),(244,'Wine - Rhine Riesling Wolf Blass',49,1,'Green'),(245,'Tea - Herbal Orange Spice',872,1,'Puce'),(246,'Lamb - Leg, Diced',765,1,'Violet'),(247,'Beef - Striploin',927,2,'Violet'),(248,'Pate - Peppercorn',405,2,'Maroon'),(249,'Wine - Chablis J Moreau Et Fils',628,3,'Goldenrod'),(250,'Cup - 4oz Translucent',797,5,'Red'),(251,'Flavouring - Raspberry',955,3,'Turquoise'),(252,'Miso - Soy Bean Paste',880,2,'Maroon'),(253,'Butter - Salted, Micro',779,1,'Purple'),(254,'Chocolate Liqueur - Godet White',526,1,'Goldenrod'),(255,'Veal - Brisket, Provimi, Bone - In',853,4,'Puce'),(256,'Snapple - Mango Maddness',408,4,'Blue'),(257,'Quiche Assorted',915,4,'Pink'),(258,'Zucchini - Yellow',573,2,'Mauv'),(259,'Veal - Striploin',753,1,'Purple'),(260,'Garbag Bags - Black',763,5,'Orange'),(261,'Pumpkin - Seed',636,5,'Aquamarine'),(262,'Tea - Lemon Green Tea',763,2,'Puce'),(263,'Wine - Cava Aria Estate Brut',899,4,'Goldenrod'),(264,'Dikon',381,2,'Turquoise'),(265,'Paper Cocktail Umberlla 80 - 180',626,4,'Blue'),(266,'Juice - Cranberry, 341 Ml',662,2,'Pink'),(267,'Pasta - Spaghetti, Dry',1000,3,'Indigo'),(268,'Nantucket - Carrot Orange',125,5,'Purple'),(269,'Flour Dark Rye',59,2,'Teal'),(270,'Chocolate - Semi Sweet',114,3,'Mauv'),(271,'Arctic Char - Fresh, Whole',680,1,'Khaki'),(272,'Pepper - Chillies, Crushed',686,1,'Crimson'),(273,'Muffin Mix - Carrot',861,3,'Indigo'),(274,'Soap - Pine Sol Floor Cleaner',54,1,'Green'),(275,'Cookie Dough - Chunky',931,3,'Teal'),(276,'Squid - Breaded',247,1,'Teal'),(277,'Soupfoamcont12oz 112con',340,1,'Blue'),(278,'Vinegar - Tarragon',242,1,'Blue'),(279,'Cheese - Brie,danish',245,1,'Pink'),(280,'Lamb - Shoulder, Boneless',535,1,'Indigo'),(281,'Energy Drink',664,3,'Maroon'),(282,'Celery',558,4,'Turquoise'),(283,'Shopper Bag - S - 4',643,2,'Teal'),(284,'Tea - Black Currant',275,5,'Yellow'),(285,'Sauce - Cranberry',417,5,'Turquoise'),(286,'Phyllo Dough',801,3,'Turquoise'),(287,'Pork - Ground',526,4,'Indigo'),(288,'Tea - Earl Grey',41,3,'Crimson'),(289,'Pail - 4l White, With Handle',738,1,'Orange'),(290,'Pie Shell - 9',502,2,'Orange'),(291,'Urban Zen Drinks',370,2,'Khaki'),(292,'Sauce - Balsamic Viniagrette',949,3,'Yellow'),(293,'Soy Protein',205,1,'Green'),(294,'Gatorade - Xfactor Berry',88,4,'Mauv'),(295,'Ocean Spray - Ruby Red',473,4,'Pink'),(296,'Flour - Fast / Rapid',544,3,'Red'),(297,'Squid Ink',845,5,'Puce'),(298,'Beef - Top Sirloin',741,3,'Aquamarine'),(299,'Muffin Mix - Chocolate Chip',706,5,'Orange'),(300,'Tea - Jasmin Green',836,1,'Mauv'),(301,'Butter - Unsalted',259,3,'Orange'),(302,'Plasticspoonblack',285,3,'Purple'),(303,'Soup Campbells Mexicali Tortilla',586,3,'Crimson'),(304,'Vinegar - Balsamic',100,3,'Red'),(305,'Broom - Corn',882,3,'Purple'),(306,'Coke - Classic, 355 Ml',257,4,'Indigo'),(307,'Pork - Chop, Frenched',766,1,'Khaki'),(308,'Shrimp - 16/20, Iqf, Shell On',859,1,'Purple'),(309,'Soup - Campbells',767,1,'Red'),(310,'Tomatoes - Cherry, Yellow',434,2,'Orange'),(311,'Dried Figs',625,1,'Purple'),(312,'Flour - Rye',206,4,'Goldenrod'),(313,'Oil - Shortening,liqud, Fry',187,5,'Aquamarine'),(314,'Muffin - Zero Transfat',986,4,'Green'),(315,'Chips Potato Salt Vinegar 43g',769,3,'Orange'),(316,'Flour - Strong Pizza',494,3,'Blue'),(317,'Pasta - Penne, Rigate, Dry',612,5,'Orange'),(318,'Langers - Ruby Red Grapfruit',794,1,'Crimson'),(319,'Oven Mitt - 13 Inch',709,5,'Orange'),(320,'Island Oasis - Sweet And Sour Mix',51,1,'Blue'),(321,'Cake Circle, Paprus',122,3,'Purple'),(322,'Pasta - Ravioli',97,3,'Turquoise'),(323,'Mustard Prepared',430,4,'Fuscia'),(324,'Oil - Cooking Spray',669,5,'Mauv'),(325,'Pastry - Cheese Baked Scones',225,5,'Yellow'),(326,'Lettuce - Red Leaf',777,1,'Pink'),(327,'Brandy - Bar',405,2,'Mauv'),(328,'Jolt Cola',799,5,'Aquamarine'),(329,'Beer - Moosehead',986,1,'Red'),(330,'Flour - Corn, Fine',939,5,'Fuscia'),(331,'Wine - Casillero Deldiablo',61,3,'Crimson'),(332,'Red Pepper Paste',181,3,'Red'),(333,'Puff Pastry - Slab',222,3,'Khaki'),(334,'Beef - Salted',14,4,'Pink'),(335,'Wine - Two Oceans Cabernet',761,3,'Teal'),(336,'Pineapple - Golden',575,4,'Blue'),(337,'Red Cod Fillets - 225g',29,2,'Yellow'),(338,'Lettuce - Red Leaf',170,2,'Goldenrod'),(339,'Chocolate Bar - Oh Henry',668,2,'Mauv'),(340,'Cheese - Shred Cheddar / Mozza',753,5,'Teal'),(341,'Fish - Base, Bouillion',225,3,'Yellow'),(342,'Pepper - Black, Ground',594,4,'Indigo'),(343,'Wine - Alsace Riesling Reserve',273,3,'Teal'),(344,'Wine - White, Pinot Grigio',489,4,'Turquoise'),(345,'Sesame Seed Black',254,1,'Puce'),(346,'Hummus - Spread',215,5,'Turquoise'),(347,'Corn - On The Cob',103,3,'Violet'),(348,'Seedlings - Clamshell',827,1,'Blue'),(349,'Cocoa Feuilletine',528,2,'Orange'),(350,'Beans - Yellow',877,5,'Yellow'),(351,'Jolt Cola - Red Eye',142,1,'Mauv'),(352,'Beer - Steamwhistle',133,2,'Aquamarine'),(353,'Shrimp - 150 - 250',990,5,'Puce'),(354,'Quinoa',187,2,'Khaki'),(355,'Wine - Red, Cooking',46,1,'Purple'),(356,'Swiss Chard',30,2,'Mauv'),(357,'Pepper - Cubanelle',236,5,'Aquamarine'),(358,'Ostrich - Prime Cut',948,2,'Green'),(359,'Liners - Baking Cups',553,4,'Khaki'),(360,'Jolt Cola',568,2,'Orange'),(361,'Dehydrated Kelp Kombo',590,5,'Crimson'),(362,'Appetizer - Sausage Rolls',360,1,'Goldenrod'),(363,'Veal - Sweetbread',527,2,'Yellow'),(364,'Wine - Pinot Noir Stoneleigh',844,1,'Maroon'),(365,'Ecolab - Orange Frc, Cleaner',976,2,'Crimson'),(366,'Muffin Mix - Banana Nut',293,2,'Indigo'),(367,'Water - Green Tea Refresher',601,5,'Crimson'),(368,'Sage - Rubbed',813,3,'Aquamarine'),(369,'Bread - Rosemary Focaccia',7,5,'Red'),(370,'Coffee - Colombian, Portioned',437,1,'Turquoise'),(371,'Table Cloth 120 Round White',344,3,'Fuscia'),(372,'Pear - Asian',792,4,'Fuscia'),(373,'Fudge - Cream Fudge',202,2,'Puce'),(374,'Beef - Prime Rib Aaa',79,2,'Yellow'),(375,'Table Cloth 54x72 White',768,5,'Green'),(376,'Ecolab - Power Fusion',188,1,'Indigo'),(377,'Pasta - Agnolotti - Butternut',403,3,'Orange'),(378,'Coffee - Colombian, Portioned',649,4,'Green'),(379,'Sauce - Salsa',132,2,'Mauv'),(380,'Clams - Canned',402,2,'Violet'),(381,'Gelatine Leaves - Bulk',774,5,'Purple'),(382,'Mcguinness - Blue Curacao',233,2,'Pink'),(383,'Cheese - Grana Padano',570,4,'Turquoise'),(384,'Melon - Honey Dew',139,5,'Violet'),(385,'Rolled Oats',824,2,'Puce'),(386,'Tomatoes - Grape',962,5,'Goldenrod'),(387,'Soup Campbells',891,1,'Goldenrod'),(388,'Frangelico',7,2,'Mauv'),(389,'Jolt Cola - Red Eye',682,2,'Teal'),(390,'Lotus Rootlets - Canned',520,2,'Yellow'),(391,'Hipnotiq Liquor',683,3,'Maroon'),(392,'Bread Base - Gold Formel',323,4,'Yellow'),(393,'Lemonade - Island Tea, 591 Ml',664,5,'Khaki'),(394,'Bread Base - Toscano',759,2,'Crimson'),(395,'Five Alive Citrus',621,3,'Khaki'),(396,'Muffins - Assorted',2,5,'Turquoise'),(397,'Wine - Barossa Valley Estate',301,4,'Green'),(398,'Soda Water - Club Soda, 355 Ml',345,2,'Puce'),(399,'Rabbit - Whole',949,1,'Teal'),(400,'Potatoes - Idaho 80 Count',294,5,'Maroon'),(401,'Ham - Cooked Bayonne Tinned',503,5,'Mauv'),(402,'Mix Pina Colada',391,4,'Aquamarine'),(403,'Wine - Red, Gallo, Merlot',973,3,'Purple'),(404,'Oil - Shortening,liqud, Fry',894,4,'Orange'),(405,'Amaretto',369,3,'Indigo'),(406,'Pastry - French Mini Assorted',395,4,'Mauv'),(407,'Wine - Malbec Trapiche Reserve',201,5,'Puce'),(408,'Burger Veggie',723,4,'Purple'),(409,'Drambuie',383,5,'Violet'),(410,'Lettuce - Green Leaf',376,2,'Orange'),(411,'Marzipan 50/50',217,5,'Purple'),(412,'Chips Potato All Dressed - 43g',201,3,'Turquoise'),(413,'Pasta - Lasagne, Fresh',586,4,'Red'),(414,'Wine - Beringer Founders Estate',792,2,'Red'),(415,'Octopus',442,3,'Turquoise'),(416,'Sprouts - Peppercress',724,4,'Fuscia'),(417,'Frangelico',174,2,'Maroon'),(418,'Lamb - Racks, Frenched',768,5,'Green'),(419,'Beer - Mill St Organic',214,2,'Indigo'),(420,'Container - Clear 32 Oz',151,2,'Turquoise'),(421,'Pecan Raisin - Tarts',18,2,'Yellow'),(422,'Cheese - Ricotta',25,5,'Purple'),(423,'Wine - Zonnebloem Pinotage',75,1,'Khaki'),(424,'Cornstarch',707,2,'Purple'),(425,'Pork Loin Bine - In Frenched',852,4,'Violet'),(426,'Wine - Mondavi Coastal Private',606,4,'Aquamarine'),(427,'Carrots - Jumbo',922,1,'Maroon'),(428,'Potatoes - Idaho 100 Count',777,4,'Fuscia'),(429,'Bread Base - Goodhearth',96,3,'Green'),(430,'Pepper - Cubanelle',482,5,'Yellow'),(431,'Soup Campbells Turkey Veg.',868,3,'Khaki'),(432,'Olive - Spread Tapenade',707,2,'Yellow'),(433,'Pail With Metal Handle 16l White',946,5,'Aquamarine'),(434,'Pork - Smoked Kassler',300,5,'Puce'),(435,'Contreau',662,4,'Blue'),(436,'Stainless Steel Cleaner Vision',328,2,'Turquoise'),(437,'Pasta - Tortellini, Fresh',245,2,'Yellow'),(438,'Sauce - Apple, Unsweetened',689,1,'Goldenrod'),(439,'Asparagus - Green, Fresh',667,4,'Teal'),(440,'Tea - Darjeeling, Azzura',317,2,'Fuscia'),(441,'Chicken - Breast, 5 - 7 Oz',344,3,'Puce'),(442,'Vol Au Vents',403,1,'Crimson'),(443,'Crab - Blue, Frozen',645,3,'Green'),(444,'Squid - Breaded',678,5,'Green'),(445,'Munchies Honey Sweet Trail Mix',979,4,'Mauv'),(446,'Wine - Periguita Fonseca',311,2,'Yellow'),(447,'Wine - Malbec Trapiche Reserve',915,3,'Mauv'),(448,'Bread - Frozen Basket Variety',683,2,'Fuscia'),(449,'Bandage - Flexible Neon',245,1,'Puce'),(450,'Wine - Ruffino Chianti Classico',543,5,'Goldenrod'),(451,'Water Chestnut - Canned',372,3,'Blue'),(452,'Wine - Rosso Toscano Igt',254,5,'Khaki'),(453,'Milk - 1%',741,3,'Purple'),(454,'Mcguinness - Blue Curacao',139,4,'Orange'),(455,'Wine - Black Tower Qr',764,2,'Crimson'),(456,'Grenadine',400,2,'Pink'),(457,'Pasta - Linguini, Dry',640,4,'Puce'),(458,'Lighter - Bbq',249,3,'Maroon'),(459,'Amarula Cream',567,5,'Puce'),(460,'Mushroom - Enoki, Dry',910,3,'Aquamarine'),(461,'Knife Plastic - White',761,5,'Khaki'),(462,'Steam Pan Full Lid',235,1,'Indigo'),(463,'Eggplant - Baby',878,3,'Teal'),(464,'Yogurt - Strawberry, 175 Gr',394,1,'Turquoise'),(465,'Berry Brulee',350,2,'Orange'),(466,'Beer - Sleeman Fine Porter',411,1,'Fuscia'),(467,'Wine - Ice Wine',573,3,'Indigo'),(468,'Edible Flower - Mixed',171,5,'Green'),(469,'Beef - Top Sirloin - Aaa',973,1,'Khaki'),(470,'Waffle Stix',740,3,'Blue'),(471,'Vinegar - Balsamic',941,5,'Yellow'),(472,'Pineapple - Regular',918,2,'Aquamarine'),(473,'Compound - Mocha',184,1,'Goldenrod'),(474,'Dooleys Toffee',735,3,'Green'),(475,'Southern Comfort',650,2,'Teal'),(476,'Grouper - Fresh',330,5,'Maroon'),(477,'Sauce - Ranch Dressing',499,3,'Blue'),(478,'Sherbet - Raspberry',424,5,'Pink'),(479,'Oven Mitts 17 Inch',32,2,'Yellow'),(480,'Cheese - Cheddarsliced',325,3,'Crimson'),(481,'Capers - Pickled',239,4,'Indigo'),(482,'Mints - Striped Red',911,4,'Goldenrod'),(483,'Oregano - Dry, Rubbed',466,1,'Orange'),(484,'Roe - White Fish',920,4,'Indigo'),(485,'Lobster - Canned Premium',380,3,'Violet'),(486,'Oil - Cooking Spray',738,3,'Green'),(487,'Broom - Push',923,3,'Khaki'),(488,'Bread - Rolls, Corn',504,5,'Blue'),(489,'Fish - Atlantic Salmon, Cold',705,5,'Aquamarine'),(490,'Squash - Butternut',264,1,'Green'),(491,'Cherries - Frozen',123,2,'Teal'),(492,'Soup - Boston Clam Chowder',301,3,'Yellow'),(493,'Ice Cream - Vanilla',526,5,'Pink'),(494,'Ocean Spray - Kiwi Strawberry',960,4,'Yellow'),(495,'Cheez-Its',999,1,'Orange'),(496,'Syrup - Monin - Passion Fruit',806,2,'Mauv'),(497,'Bread - Pita',682,3,'Crimson'),(498,'Oil - Food, Lacquer Spray',588,3,'Puce'),(499,'Muffin Mix - Corn Harvest',530,5,'Puce'),(500,'Beer - Upper Canada Light',684,5,'Blue');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `loc_id` int(5) NOT NULL,
  `loc_street` varchar(40) NOT NULL,
  `loc_city` varchar(20) NOT NULL,
  `loc_state` varchar(2) NOT NULL,
  `loc_zip` varchar(5) NOT NULL,
  `loc_name` varchar(15) NOT NULL,
  `loc_cap` int(10) NOT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'5882 Orci Rd.','Surat','MD','51754','HQ',0),(2,'1592 Sociis Av.','Zwolle','DE','57575','WareHouse 1',0),(3,'3254 Eleifend. Ave','Anklam','CA','30587','WareHouse 2',0),(4,'1901 Etiam St.','MangoTown','CA','30587','Annex',0),(5,'4036 Ipsum. Rd.','Tomohon','NJ','00286','Storage Pod',0),(6,'101 Somewhere Rd','Severna Park','MD','21144','Chapel',8000);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(5) NOT NULL AUTO_INCREMENT,
  `imp_date` varchar(20) DEFAULT NULL,
  `comp_date` varchar(20) DEFAULT NULL,
  `src_loc` int(3) NOT NULL,
  `dest_loc` int(3) DEFAULT NULL,
  `item_id` int(10) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `order_qty` int(5) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`order_id`),
  KEY `orders_FK` (`user_id`),
  KEY `orders_FK_1` (`item_id`),
  KEY `orders_FK_2` (`src_loc`),
  KEY `orders_FK_3` (`dest_loc`),
  CONSTRAINT `orders_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `orders_FK_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `orders_FK_2` FOREIGN KEY (`src_loc`) REFERENCES `locations` (`loc_id`),
  CONSTRAINT `orders_FK_3` FOREIGN KEY (`dest_loc`) REFERENCES `locations` (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'6/17/2020','6/21/2020',1,6,262,11,635,0),(2,'8/23/2020','6/29/2020',3,4,92,7,669,0),(3,'11/2/2020','NULL',5,1,34,12,157,1),(4,'5/31/2020','4/8/2021',4,1,401,2,152,0),(5,'1/24/2021','9/8/2020',3,4,278,4,471,0),(8,'9/15/2020',NULL,3,4,342,NULL,18,1),(9,'5/23/2020','12/2/2020',1,5,376,5,256,0),(10,'5/3/2020','NULL',2,1,420,5,214,1),(11,'6/10/2021','10/25/2020',4,3,222,4,144,0),(12,'9/16/2020','11/24/2020',1,5,126,7,422,0),(13,'10/24/2020','1/18/2021',3,4,111,12,81,0),(14,'3/6/2021','',1,3,17,1,422,1),(15,'3/30/2021',NULL,1,2,222,NULL,555,1),(16,'6/27/2020','10/4/2020',5,5,187,8,974,0),(17,'5/27/2020','09/05/2021',1,1,254,1,82,1),(18,'5/19/2020','6/24/2020',4,3,315,10,129,0),(19,'5/11/2021','NULL',2,2,93,2,66,1),(20,'1/24/2021','10/8/2020',3,2,162,5,351,0),(21,'5/28/2021','3/30/2021',5,2,405,12,349,0),(22,'2/12/2021','3/29/2021',2,1,265,1,472,1),(23,'8/11/2020',NULL,3,3,351,5,275,1),(24,'10/20/2020','1/18/2021',2,2,412,12,820,0),(25,'12/19/2020',NULL,1,3,411,NULL,711,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` int(2) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (3,'Admin'),(2,'Manager'),(1,'Worker');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_wu2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,'Something'),(2,'TestPass'),(3,'TestPass'),(4,'TestPass'),(5,'TestPass'),(6,'TestPass'),(7,'TestPass'),(8,'TestPass'),(10,'TestPass'),(11,'TestPass'),(12,'TestPass');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(75) NOT NULL,
  `username` varchar(20) NOT NULL,
  `role_id` int(2) NOT NULL DEFAULT 1,
  `loc_id` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'scott@nurvox.com','Scott','Forsyth','scott',3,1),(2,'ryan.q.stewart@gmail.com','Ryan','Stewart','ryan',3,2),(3,'abellmio@gmail.com','Andrew','Bellmio','andrew',3,3),(4,'nathan.clavelli@yahoo.com','Nathan','Clavelli','nathan',3,4),(5,'Bstiller0@miibeian.com',' Ben','Stiller','worker1',1,1),(6,'dvalett1@ucla.edu','Dallon','Valett','worker2',1,2),(7,'aquinet2@fc2.com','Ashlie','Quinet','worker3',1,3),(8,'etaffrey3@printfriendly.com','Edd','Taffrey','worker4',1,6),(10,'ahendrichs0@ycombinator.com','Allen','Hendrichs','mgr1',2,2),(11,'sdrinkel1@skype.com','Sela','Drinkel','mgr2',2,3),(12,'rkops2@yahoo.com','Robinson','Kops','mgr3',2,4),(33,'email@place.com','testy','mctesterson','testPerson',1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'GRP5_scott'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-09  5:32:18
