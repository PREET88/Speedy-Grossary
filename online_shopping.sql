-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 27, 2017 at 04:07 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `online_shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_email` varchar(25) NOT NULL,
  `a_password` varchar(11) NOT NULL,
  `role` varchar(15) NOT NULL,
  `a_status` int(11) NOT NULL,
  `a_name` varchar(25) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`a_id`, `a_email`, `a_password`, `role`, `a_status`, `a_name`) VALUES
(2, 'er.upnejakaran@gmail.com', 'karan123', 'customer', 1, 'Karan'),
(3, 'erkaranupneja@gmail.com', 'strong', 'admin', 1, 'Karan'),
(4, 'adityasoni9027@gmail.com', '123', 'customer', 1, 'Aditya'),
(5, 'rahul@gmail.com', '454', 'delivery_boy', 1, 'Rahul'),
(6, 'rohan@gmail.com', 'rohan', 'customer', 1, 'Rohan'),
(7, 'mahek@gmail.com', 'strong', 'customer', 1, 'Madhav'),
(8, 'tgsgnr@gmail.com', 'kirti', 'customer', 1, 'Kirti'),
(9, 'raj@gmail.com', 'raj', 'delivery_boy', 1, 'Raj'),
(10, 'rakeshupneja.kb@gmail.com', 'Rj133m8426', 'customer', 1, 'Rakesh Upneja'),
(11, 'rajeshupneja@gmail.com', 'rajesh', 'customer', 1, 'Rajesh');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(25) NOT NULL,
  `status` int(11) NOT NULL COMMENT 'to remove a particular category for some time',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`c_id`, `c_name`, `status`) VALUES
(9, 'Vegetable', 1),
(10, 'Household', 1),
(11, 'Beverages', 1),
(12, 'Branded Food', 1),
(13, 'Fruits', 1),
(14, 'Frozen food', 1),
(22, 'Spices', 1),
(27, 'Dry Fruits', 1),
(28, 'Diary Products', 1),
(29, 'Personal Care', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT,
  `cs_name` varchar(15) NOT NULL,
  `cs_contact` varchar(10) NOT NULL,
  `cs_email` varchar(30) NOT NULL,
  `cs_address` varchar(40) NOT NULL,
  `cs_password` varchar(10) NOT NULL,
  PRIMARY KEY (`cs_id`),
  UNIQUE KEY `cs_address` (`cs_address`),
  UNIQUE KEY `cs_email_2` (`cs_email`),
  KEY `cs_email` (`cs_email`),
  KEY `cs_address_2` (`cs_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cs_id`, `cs_name`, `cs_contact`, `cs_email`, `cs_address`, `cs_password`) VALUES
(7, 'Karan', '9566665412', 'er.upnejakaran@gmail.com', 'sri Ganganagar', 'karan123'),
(8, 'Aditya', '9782244339', 'adityasoni9027@gmail.com', '213 aggarsain nagar,sri ganganagar', '123'),
(9, 'Rohan', '95468522', 'rohan@gmail.com', 'ssetg', 'rohan'),
(10, 'Madhav', '2147483647', 'mahek@gmail.com', '32 nehru nagar', 'strong'),
(11, 'Kirti', '2147483647', 'tgsgnr@gmail.com', 'tilak nagar', 'kirti'),
(12, 'Rakesh', '2147483647', 'rakeshupneja.kb@gmail.com', '39 Tilak Nagar Ganganagar ', 'Rj133m8426'),
(13, 'Rajesh', '2147483647', 'rajeshupneja@gmail.com', '39 Tilak Nagar', 'rajesh');

-- --------------------------------------------------------

--
-- Table structure for table `customer_message`
--

CREATE TABLE IF NOT EXISTS `customer_message` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `messege` varchar(1500) NOT NULL,
  `date` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_message`
--

INSERT INTO `customer_message` (`m_id`, `name`, `messege`, `date`, `email`, `contact`, `status`, `subject`) VALUES
(1, 'karan', 'hiiii', '2017-07-06', 'erkaranupneja@gmail.com', 2147483647, 1, 'test'),
(2, 'Madhav', 'Your service is too good!! I received my order within a day.', '2017-07-07', 'er.upnejakaran@gmail.com', 2147483647, 1, 'Feedback'),
(3, 'Tarun', 'your service is good!!!!!', '2017-07-11', 'erkaranupneja@gmail.com', 789456221, 1, 'Feedback'),
(4, 'Aditya Soni', 'when product will be diliverder', '2017-08-01', 'adityasoni9027@gmail.com', 2147483647, 1, 'test ');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `cs_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_date` date NOT NULL,
  `o_total` float NOT NULL,
  `o_tax` float NOT NULL,
  `o_gt` float NOT NULL,
  `o_status` int(11) NOT NULL COMMENT 'condition of order 1-placed 2-dispatched 3-dilivered',
  `a_id` int(11) NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`cs_id`, `o_id`, `o_date`, `o_total`, `o_tax`, `o_gt`, `o_status`, `a_id`) VALUES
(7, 12, '2017-07-05', 384, 46.08, 430.08, 3, 5),
(8, 13, '2017-07-05', 32, 3.84, 35.84, 3, 5),
(9, 14, '2017-07-05', 230, 27.6, 257.6, 3, 5),
(7, 15, '2017-07-05', 52, 6.24, 58.24, 3, 5),
(10, 16, '2017-07-06', 317, 38.04, 355.04, 3, 9),
(11, 20, '2017-07-06', 200, 24, 224, 3, 5),
(11, 21, '2017-07-07', 230, 27.6, 257.6, 3, 5),
(11, 22, '2017-07-07', 230, 27.6, 257.6, 3, 5),
(7, 24, '2017-07-07', 154, 18.48, 172.48, 3, 5),
(7, 25, '2017-07-07', 100, 12, 112, 3, 5),
(7, 26, '2017-07-07', 270, 32.4, 302.4, 3, 5),
(12, 27, '2017-07-08', 300, 36, 336, 3, 9),
(7, 28, '2017-07-08', 87, 10.44, 97.44, 3, 5),
(12, 30, '2017-07-08', 20, 2.4, 22.4, 3, 5),
(13, 31, '2017-07-09', 186, 22.32, 208.32, 3, 9),
(13, 32, '2017-07-11', 127, 15.24, 142.24, 2, 9),
(8, 33, '2017-07-27', 687, 82.44, 769.44, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `od_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`od_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`od_id`, `o_id`, `p_id`, `qty`, `price`) VALUES
(1, 12, 2, 1, 230),
(2, 12, 9, 1, 154),
(3, 13, 7, 1, 32),
(4, 14, 2, 1, 230),
(5, 15, 15, 1, 20),
(6, 15, 7, 1, 32),
(7, 16, 2, 1, 230),
(8, 16, 1, 1, 87),
(16, 20, 10, 1, 200),
(17, 21, 2, 1, 230),
(18, 22, 2, 1, 230),
(19, 23, 15, 1, 20),
(20, 24, 9, 1, 154),
(21, 25, 11, 1, 100),
(22, 26, 6, 1, 70),
(23, 26, 10, 1, 200),
(24, 27, 2, 1, 230),
(25, 27, 6, 1, 70),
(26, 28, 1, 1, 87),
(27, 29, 14, 1, 46),
(28, 30, 5, 1, 20),
(29, 31, 7, 1, 32),
(30, 31, 9, 1, 154),
(31, 32, 5, 1, 20),
(32, 32, 15, 1, 20),
(33, 32, 13, 1, 87),
(34, 33, 26, 1, 289),
(35, 33, 6, 1, 70),
(36, 33, 12, 1, 150),
(37, 33, 11, 1, 100),
(38, 33, 1, 1, 78);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `cost` int(11) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `u_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL COMMENT 'in stock',
  `p_offer` float NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`p_id`, `c_id`, `p_name`, `cost`, `description`, `u_id`, `qty`, `p_offer`) VALUES
(1, 11, 'Sprite', 87, 'Sprite is a wonderful party maker that can add immediate zing and zeal to the dullest of celebrations. It is also an outstanding remedy to fight off the ill effects of summers. The high acidic content of Sprite Soft Drink online also helps cure digestion troubles.', 2, 9, 0.1),
(2, 9, 'Broccoli', 230, 'healthy green vegetable from cauliflower family.broccoli can be used in multiple ways to prepare nutritious and tasty meals. ', 4, 12, 0.5),
(3, 9, 'onion', 30, 'Onion is a vegetable which is almost like a staple in Indian food. This is also known to be one of the essential ingredients of raw salads. ', 4, 0, 0),
(4, 11, 'Cocacola', 35, 'Coca-Cola Zero is one of The Coca-Cola Companys most successful and significant innovations. It offers the same Great Coke Taste, with Zero Sugar. • Energy 0.3 kcal• Carbohydrate 0g• Sugar 0g• Protein 0g• Fat 0g\n\n', 2, 0, 0),
(5, 12, 'Cream and Onion Lays', 20, 'Lays American Style is one of the zests among additional tastes of chips. ', 2, 44, 0),
(6, 13, 'Mango Alphonso ', 70, 'This juicy, delicious and mouth-watering fruit comes from Ratnagiri. Alphonso Mango, also known as “King of Mangoes” is a premium quality mango in terms of sweetness, richness and flavour. It is famous for its unique fragrance.', 4, 544, 0),
(7, 9, 'Cauliflower', 32, 'Cauliflower is a versatile vegetable, which makes for a great side dish or main dish. A member of the cruciferous vegetable family. cauliflower is loaded with anti-oxidants and phyto-nutrients.', 4, 587, 0),
(9, 9, 'Capsicum - Red', 154, 'Fresho Red Capsicum is rich in carotenoid, phytonutrients and contains nearly eleven times more beta-carotene than green bell peppers as well as one and a half times more vitamin C. It contain sugary, almost fruity flavor. Pimento and paprika are both arranged from red bell peppers. ', 4, 847, 0.05),
(10, 13, 'Strawberry', 200, 'Deliciously sweet, strawberries are great with cereals, cakes, muffins, and even snacking. Strawberries are rich in vitamin C, phytonutrients and antioxidants. They help improve bone strength and regulate blood pressure.', 4, 494, 0),
(11, 13, 'Pineapple', 100, 'The ripe fruits have a quality sweet aroma, which also shows its flavor. It has a dripping sweet, taste with a sharp bite. It is an extremely juicy fruit. It has more sugar content and therefore a sweeter flavor and more caring texture.', 4, 47, 0),
(12, 13, 'Apple', 150, 'apples are typically round, they contain between 9–11% sugars by weight and have a dense flesh that is sweeter and crisper than many other apple cultivars, It keeps well and supplies several different nutrients that are important for your health.', 4, 464, 0),
(13, 11, 'Pepsi', 87, 'Pepsi is the pop that shakes things up! Pepsi is ubiquitous on just about every social occasion.', 1, 948, 0),
(14, 11, 'Maaza ', 46, 'How about quenching your thirst with a delicious mango drink? Maaza from the house of Coca Cola is one of the most amazing drinks which is loved for its delicious taste, thickness and lovely colour. This flavoured drink can be quite refreshing on a hot summer day.', 1, 483, 0),
(15, 12, 'Maggi Hot-Head', 20, 'MAGGI 2-Minute Noodles is one of the largest & most loved food brands that defines the Instant Noodles category in India. The HOTHEADS range is an offering that seeks to provide spicy deliciousness in never before Noodles flavours.', 3, 583, 0),
(16, 12, 'Maggi tomato sause', 90, 'MAGGI Sauces have been an integral part of the Indian consumers households for decades now. Launched in the mid-1980s,You can have this sauce with almost everything - samosas, kachoris, pakodas, noodles etc. Even rotis become tastier and more fun with a dash of a little sauce.', 2, 848, 0),
(17, 14, 'McCain French - Fries, 420 gm', 90, 'McCain French Fries are a taste sensation - crispy on the outside, fluffy in the centre and delicious through and through.', 3, 25, 0),
(18, 14, 'Safal Frozen - Green Peas', 64, 'Safal peas are picked from the green fields of north India and frozen while still fresh using the most advanced individual quick freezing (IQF) technique. Safal Peas are natural! And contain no preservatives or additives.', 3, 52, 0),
(19, 14, 'Safal Frozen - Sweet Corn', 56, 'Safal Sweet Corn is selected only from the best farms across the country and is frozen while still fresh, using the ultra-advanced individual quick Freezing (IQF) technique. Safal Sweet Corn is natural and contains no preservatives or additives.', 3, 45, 0),
(20, 14, 'Buffet Paratha - Aloo, 400 gm (4 pcs)', 110, 'The buffet aloo paratha comes in a 300 gm poly-pack and is ready to eat within minutes. These nutritious parathas can be enjoyed with curries, yogurt, pickles or chutneys. The buffet jeera paratha brings to you a special and traditional culinary classic from north.', 3, 10, 0),
(21, 10, 'Lizol Floor Cleaner - Citrus', 158, 'Lizol is Indias No.1 floor cleaning brand and recommended by the Indian Medical Association. Keep your home fresh and germ-free with Lizols comprehensive 3 in 1 home-care solution. Lizol Disinfectant Surface Cleaner contains a distinctive formulation that kills 99.9% germs .', 1, 56, 0),
(22, 10, 'Harpic Toilet Cleaner ', 78, 'Harpic Power Plus the ultimate one stop solution for all your toilet cleaning needs. A specialized All-in-one product, unlike the ordinary toilet cleaners, harpic power plus combines the benefits of tough stain remover, 99.9% germ killer.', 1, 15, 0),
(23, 10, 'Vim Dishwash Gel - Lemon', 20, 'With the Power of 100 lemons, 1 spoon of Vim Gel is all you need to clean a sink full of dishes. Unlike bars, Vim Gel does not leave any residue on the dishes and gives you a pleasant cleaning experience with its refreshing lemon fragrance.', 1, 250, 0),
(24, 10, 'Surf Excel ', 479, 'With Surf excel Easy Wash, now remove tough stains easily with the power of ten hands. We understand that washing clothes and removing stains can be extremely tiring and cumbersome. ', 4, 9, 0),
(26, 27, 'Happilo Cashew Nuts ', 289, 'Our cashews are a real treat. These are the best nuts you can ever find. They are delightfully rich and tasty, a nutritious treat that will make a great snack time.', 3, 3, 0),
(27, 27, 'Rostaa Berries - Blue', 495, 'Its not only the most wonderful flavour and taste of Blueberries but its rich nutrient benefits too that make it the best berry fruit.', 3, 44, 0),
(28, 27, 'Rostaa Almond - Roasted & Salted', 340, 'Skittles Original Candies Will Wake Up Your Taste Buds. They Are Free Of Gluten And Feature An Assortment Of Both Natural And Artificial Flavors.', 3, 55, 0),
(29, 27, 'Tong Garden Cocktail Nuts', 300, 'A Cholesterol Free Food.A Trans Fatty Acids Free Food.Good Source Of Protein. Superior Quality Fun Time Crunch.Fit 4 Active Lifestyle.', 3, 111, 0.25),
(30, 22, 'MTR Powder - Turmeric', 32, 'MTR turmeric powder is one of the most reliable spices as the powder is extracted from high quality turmeric known as Sangali. They are packed with care so that the spice retains its freshness, colour and flavour till it reaches your home.', 3, 0, 0),
(31, 22, 'MTR Powder - Chilli', 60, 'Established in 1924, MTR is the contemporary way to authentic tasting food, Our products are backed by culinary expertise honed, over 8 decades of serving wholesome, tasty and high quality vegetarian food, Using authentic Indian recipes, the purest and best quality natural ingredients and traditional methods of preparation.', 3, 65, 0),
(32, 22, 'Mdh Masala - Chicken', 34, 'Mdh Chicken Masala Is A Spice Blend For Chicken. Made With Coriander, Chilli, Cumin, Fenugreek Leaves, Turmeric And Other Ingredients', 3, 488, 0),
(33, 22, 'Dabur Ginger Garlic Paste', 22, 'Homemade Ginger Garlic brings you the freshest paste in one sealed bag. Experience the strong, yet savoury blends of these ingredients in your cooking, a perfect addition for any dish you prepare.', 3, 11, 0),
(34, 28, 'Nestle A+ Slim Dahi - Low Fat', 70, 'Nestle has just added a twist of health to our favourite dahi making it more healthier and tastier with the launch of this product. Having only 1.5g of fat per 100gm of serving, this dahi is the best option for health concious people!', 1, 51, 0),
(35, 28, 'Amul Malai Paneer', 70, 'A Cholesterol Free Food.A Trans Fatty Acids Free Food.Good Source Of Protein. Superior Quality Fun Time Crunch.Fit 4 Active Lifestyle.', 3, 54, 0),
(36, 29, 'Axe Signature Gold Italian Bergamot & Amber Wood Perfume', 450, 'A masculine and woody bold fragrance, the New Axe Signature Italian Bergamot and Amber Wood for men is a Eau De Toilette made with premium classy ingredients. This scent has the sparkling notes of Amber Wood combined with the extremely masculine Amber Wood.. This could make you a man who enchants everyone with his style and sophistication. Your dear ones would be delighted to get a scent which offers such a mesmerizing scent. Fragrance made with unique ingredients to bring out whats unique in you.', 1, 23, 0),
(38, 29, 'Garnier Men Face Wash - Oil Clear', 185, 'Garnier Men Oil Clear Face Wash is the 1st deep cleansing face wash for men - It removes excessive oil without drying while ensuring a day long oil free fee', 1, 45, 0),
(39, 29, 'Nivea Shower Gel - Active For Men', 199, 'WITH ACTIVE CHARCOAL FOR DEEP CLEANSING. 3 in 1 for Face, Body & Hair.Dirt, grime and pollution getting you down? Try the NEW NIVEA MEN ACTIVE CLEAN SHOWER GEL WITH ACTIVE CHARCOAL.', 1, 522, 0),
(40, 29, 'Dove Go Fresh Body Wash', 99, 'Replenish the moisture in your dry skin with the nourishment of Dove Go Fresh Body Lotion. This fast absorbing hand and body lotion by Dove consists of a refreshing cucumber and green tea scent, along with a cooling menthol sensation that revitalizes your skin! This lotion leaves the skin feeling dewy and soft. Because of its light and supple texture, you can use this moisturiser any time of the day because and its dermatologically tested.', 1, 444, 0),
(41, 28, 'Amul Cheese - Slices', 118, 'Amul Pasteurised Processed Cheddar Cheese is made from Cheese: Sodium Citrate: Common Salt: Citric Acid: permitted natural color - Annatto. Emulsifier and Class II preservatives. It is made from graded cow/buffalo milk using microbial rennet. Wholesome cheese. Good source of Calcium and milk Proteins.', 3, 82, 0),
(42, 28, 'Nandini GoodLife Toned Milk', 23, 'Goodlife Smart Homogenised Double Toned Milk UHT processed milk with Min 1.5% fat and Min 9.0% SNF fortified with vitamins A and D. Suitable for preparing tea/coffee, milk shakes and milk delights for people leading a fitness conscious lifestyle.', 1, 5, 0),
(43, 12, 'Ferrero Rocher - Chocolate ', 475, 'Chocolate. The word itself shows us a mouth watering image of a sinfully rich and dark cream treat melting in our mouth as we close our eyes and enjoy. For years, Ferrero Rocher has been associated with high quality chocolates that are well known around the world. The Crisp Hazelnut Milk Chocolate Wafer Biscuits is a signature treat produced by this brand.', 3, 45, 0.35);

-- --------------------------------------------------------

--
-- Table structure for table `to_do`
--

CREATE TABLE IF NOT EXISTS `to_do` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(400) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(10) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`u_id`, `u_name`) VALUES
(1, 'ml'),
(2, 'litre'),
(3, 'gm'),
(4, 'kg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
