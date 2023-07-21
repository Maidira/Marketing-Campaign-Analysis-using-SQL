CREATE DATABASE Marketing_Campaign_Analysis;

USE Marketing_Campaign_Analysis;


-- Table Creation Queries

CREATE TABLE `CityData` (
  `City_Id` int NOT NULL,
  `City_Name` varchar(64) NOT NULL,
  `State` varchar(64) NOT NULL,
  `CityTier` int NOT NULL,
  PRIMARY KEY (`City_Id`)
);

CREATE TABLE `Customer` (
  `Customer_Id` varchar(8) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Gender` char NOT NULL,
  `City_Id` int DEFAULT NULL,
  `Pincode` int DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `income_bracket` float DEFAULT NULL,
  `emailId` varchar(256) DEFAULT NULL,
  `PhoneNo` long DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`),
  KEY `city_idx` (`City_Id`),
  CONSTRAINT `City` FOREIGN KEY (`City_Id`) REFERENCES `City` (`City_Id`)
);

CREATE TABLE `Campaign` (
  `campaign_id` varchar(32) NOT NULL,
  `campaignType` varchar(128) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`campaign_id`)
);


CREATE TABLE `Item` (
  `Item_Id` varchar(32) NOT NULL,
  `Item_Name` varchar(45) NOT NULL,
  `Item_Category` varchar(128) NOT NULL,
  `Price` int NOT NULL,
  PRIMARY KEY (`Item_Id`)
);

CREATE TABLE `CouponMapping` (
  `coupon_id` varchar(32) NOT NULL,
  `item_id` varchar(32) DEFAULT NULL,
  `couponType` varchar(128) NOT NULL,
  `Value` float NOT NULL,
  `Min_Purchase` float NOT NULL,
  `Expiry` int NOT NULL,
  PRIMARY KEY (`coupon_id`),
  KEY `item_idx` (`item_id`),
  CONSTRAINT `Item` FOREIGN KEY (`item_id`) REFERENCES `Item` (`Item_Id`)
);

CREATE TABLE `CustomerTransactionData` (
  `Trans_Id` varchar(32) NOT NULL,
  `Cust_Id` varchar(8) DEFAULT NULL,
  `item_id` varchar(32) DEFAULT NULL,
  `campaign_id` varchar(32) DEFAULT NULL,
  `coupon_id` varchar(32) DEFAULT NULL,
  `quantity` int NOT NULL,
  `PurchasingAmt` float NOT NULL,
  `PurchaseDate` date NOT NULL,
  `OrderType` varchar(45) NOT NULL,
  PRIMARY KEY (`Trans_Id`),
  KEY `customer_idx` (`Cust_Id`),
  KEY `itemTrans_idx` (`item_id`),
  KEY `campaign_idx` (`campaign_id`),
  KEY `coupon_idx` (`coupon_id`),
  CONSTRAINT `campaign` FOREIGN KEY (`campaign_id`) REFERENCES `Campaign` (`campaign_id`),
  CONSTRAINT `coupon` FOREIGN KEY (`coupon_id`) REFERENCES `CouponMapping` (`coupon_id`),
  CONSTRAINT `customer` FOREIGN KEY (`Cust_Id`) REFERENCES `Customer` (`Customer_Id`),
  CONSTRAINT `itemTrans` FOREIGN KEY (`item_id`) REFERENCES `Item` (`Item_Id`)
);


-- Data Insertion Queries

INSERT INTO CityData VALUES (1, 'Delhi', 'Delhi', 1);
INSERT INTO CityData VALUES (2, 'Gurugram', 'Haryana', 1);
INSERT INTO CityData VALUES (3, 'Bengaluru', 'Karnataka', 1);
INSERT INTO CityData VALUES (4, 'Mumbai', 'Maharastra', 1);
INSERT INTO CityData VALUES (5, 'Chennai', 'Tamil Nadu', 1);
INSERT INTO CityData VALUES (6, 'Hyderabad', 'Telangana', 1);
INSERT INTO CityData VALUES (7, 'Pune', 'Maharastra', 1);
INSERT INTO CityData VALUES (8, 'Kolkata', 'West Bengal', 1);
INSERT INTO CityData VALUES (9, 'Ahmedabad', 'Gujrat', 1);
INSERT INTO CityData VALUES (10, 'Surat', 'Gujrat', 2);
INSERT INTO CityData VALUES (11, 'Jaipur', 'Rajasthan', 2);
INSERT INTO CityData VALUES (12, 'Jodhpur', 'Rajasthan', 2);
INSERT INTO CityData VALUES (13, 'Udaipur', 'Rajasthan', 2);
INSERT INTO CityData VALUES (14, 'Amritsar', 'Punjab', 2);
INSERT INTO CityData VALUES (15, 'Chandigarh', 'Punjab', 2);
INSERT INTO CityData VALUES (16, 'Jalandhar', 'Punjab', 3);
INSERT INTO CityData VALUES (17, 'Indore', 'Madhya Pradesh', 2);
INSERT INTO CityData VALUES (18, 'Noida', 'Uttar Pradesh', 2);
INSERT INTO CityData VALUES (19, 'Rewari', 'Haryana', 3);
INSERT INTO CityData VALUES (20, 'Goa', 'Maharastra', 2);
INSERT INTO CityData VALUES (21, 'Dehradun', 'Uttarakhan', 2);
INSERT INTO CityData VALUES (22, 'Ranchi', 'Jharkhand', 2);
INSERT INTO CityData VALUES (23, 'Raipur', 'Chattisgarh', 2);
INSERT INTO CityData VALUES (24, 'Patna', 'Bihar', 2);
INSERT INTO CityData VALUES (25, 'Thiruvananthapuram ', 'Kerala', 2);
INSERT INTO CityData VALUES (26, 'Shimla', 'Himachal Pradesh', 2);
INSERT INTO CityData VALUES (27, 'Patna', 'Bihar', 2);
INSERT INTO CityData VALUES (28, 'Bhubaneshwar', 'Orissa', 2);
INSERT INTO CityData VALUES (29, 'Puducherry', 'Puducherry', 3);
INSERT INTO CityData VALUES (30, 'Lucknow', 'Uttar Pradesh', 2);
INSERT INTO CityData VALUES (31, 'Srinagar', 'Jammu and Kashmir', 3);

INSERT INTO Customer VALUES ('C_1', 'Chimayi Shishir', 'F', 14, 649454, '1980-01-01', 19926019, 'ChimayiShishir80@outlook.com', 9917570056);
INSERT INTO Customer VALUES ('C_2', 'Shrilata Nihar', 'F', 24, 331918, '1980-02-15', 18057067, 'ShrilataNihar80@gmail.com', 9888004031);
INSERT INTO Customer VALUES ('C_3', 'Kundanika Waman', 'F', 17, 280897, '1980-03-31', 461274, 'KundanikaWaman80@gmail.com', 9898083820);
INSERT INTO Customer VALUES ('C_4', 'Basabi Kosanam', 'F', 24, 553639, '1980-05-15', 17109546, 'BasabiKosanam80@outlook.com', 9966967813);
INSERT INTO Customer VALUES ('C_5', 'Navaneeta Nayyar', 'F', 31, 549301, '1980-06-29', 2514512, 'NavaneetaNayyar80@gmail.com', 9992794908);
INSERT INTO Customer VALUES ('C_6', 'Ascharya Vasudha', 'F', 30, 633384, '1980-08-13', 3986178, 'AscharyaVasudha80@gmail.com', 9993808180);
INSERT INTO Customer VALUES ('C_7', 'Rajanigandha Deol', 'F', 30, 953803, '1980-09-27', 12075554, 'RajanigandhaDeol80@gmail.com', 9891140810);
INSERT INTO Customer VALUES ('C_8', 'Swapna Bhanjee', 'F', 4, 506485, '1980-11-11', 4592961, 'SwapnaBhanjee80@gmail.com', 9944594868);
INSERT INTO Customer VALUES ('C_9', 'Shyama Gajaren', 'F', 26, 290116, '1980-12-26', 12295678, 'ShyamaGajaren80@outlook.com', 9983726536);
INSERT INTO Customer VALUES ('C_10', 'Sharanya Paritosh', 'F', 26, 598804, '1981-02-09', 18785191, 'SharanyaParitosh81@yahoo.com', 9978696886);
INSERT INTO Customer VALUES ('C_11', 'Shruti Koduri', 'F', 22, 733768, '1981-03-26', 8009133, 'ShrutiKoduri81@yahoo.com', 9928742098);
INSERT INTO Customer VALUES ('C_12', 'Jamuna Sukhjinder', 'F', 22, 813976, '1981-05-10', 17498571, 'JamunaSukhjinder81@outlook.com', 9986403151);
INSERT INTO Customer VALUES ('C_13', 'Shilpita Pujar', 'F', 30, 847102, '1981-06-24', 7693411, 'ShilpitaPujar81@outlook.com', 9894239134);
INSERT INTO Customer VALUES ('C_14', 'Rupali Surendra', 'F', 4, 198786, '1981-08-08', 4894020, 'RupaliSurendra81@gmail.com', 9973324100);
INSERT INTO Customer VALUES ('C_15', 'Sanjivani Konkipudi', 'F', 18, 865773, '1981-09-22', 4811107, 'SanjivaniKonkipudi81@gmail.com', 9981456300);
INSERT INTO Customer VALUES ('C_16', 'Vidula Gahlot', 'F', 3, 577955, '1981-11-06', 16968294, 'VidulaGahlot81@yahoo.com', 9957462308);
INSERT INTO Customer VALUES ('C_17', 'Ulupi Oruganti', 'F', 18, 751118, '1981-12-21', 15754677, 'UlupiOruganti81@gmail.com', 9996630731);
INSERT INTO Customer VALUES ('C_18', 'Shreemayi Naik', 'F', 27, 931187, '1982-02-04', 14433101, 'ShreemayiNaik82@gmail.com', 9982104707);
INSERT INTO Customer VALUES ('C_19', 'Firoza Naueshwara', 'F', 12, 364634, '1982-03-21', 16796064, 'FirozaNaueshwara82@gmail.com', 9997788385);
INSERT INTO Customer VALUES ('C_20', 'Diksha Punita', 'F', 26, 925685, '1982-05-05', 2906696, 'DikshaPunita82@rediffmail.com', 9996098427);
INSERT INTO Customer VALUES ('C_21', 'Nileen Saginala', 'F', 10, 110047, '1982-06-19', 1204507, 'NileenSaginala82@yahoo.com', 9961297119);
INSERT INTO Customer VALUES ('C_22', 'Mythili Pandya', 'F', 11, 344119, '1982-08-03', 6837959, 'MythiliPandya82@gmail.com', 9993580168);
INSERT INTO Customer VALUES ('C_23', 'Rachna Gaekwad', 'F', 28, 228254, '1982-09-17', 872629, 'RachnaGaekwad82@outlook.com', 9915960496);
INSERT INTO Customer VALUES ('C_24', 'Anusha Sharmistha', 'F', 9, 602422, '1982-11-01', 5344198, 'AnushaSharmistha82@yahoo.com', 9957631961);
INSERT INTO Customer VALUES ('C_25', 'Asha Vattyam', 'F', 6, 428686, '1982-12-16', 10474183, 'AshaVattyam82@gmail.com', 9959993706);
INSERT INTO Customer VALUES ('C_26', 'Padmalaya Suravinda', 'F', 23, 914721, '1983-01-30', 17646988, 'PadmalayaSuravinda83@gmail.com', 9949470946);
INSERT INTO Customer VALUES ('C_27', 'Pushpita Shefali', 'F', 5, 506946, '1983-03-16', 6613822, 'PushpitaShefali83@outlook.com', 9989533234);
INSERT INTO Customer VALUES ('C_28', 'Hasita Yalamanchilli', 'F', 24, 578444, '1983-04-30', 9198106, 'HasitaYalamanchilli83@yahoo.com', 9934252235);
INSERT INTO Customer VALUES ('C_29', 'Tarini Chiba', 'F', 15, 668839, '1983-06-14', 4923523, 'TariniChiba83@outlook.com', 9919989375);
INSERT INTO Customer VALUES ('C_30', 'Ruksana Kumur', 'F', 31, 755216, '1983-07-29', 11969254, 'RuksanaKumur83@gmail.com', 9989116264);
INSERT INTO Customer VALUES ('C_31', 'Sampat Praharaj', 'M', 25, 542809, '1983-09-12', 15471559, 'SampatPraharaj83@gmail.com', 9958591313);
INSERT INTO Customer VALUES ('C_32', 'Harkrishna Gangesh Prasai', 'M', 7, 460053, '1983-10-27', 18610091, 'HarkrishnaGangeshPrasai83@outlook.com', 9883047897);
INSERT INTO Customer VALUES ('C_33', 'Mahabahu Devadas Mansey', 'M', 24, 180442, '1983-12-11', 10094196, 'MahabahuDevadasMansey83@outlook.com', 9914986135);
INSERT INTO Customer VALUES ('C_34', 'Lav Sreerupa', 'M', 4, 429528, '1984-01-25', 3440891, 'LavSreerupa84@gmail.com', 9927789037);
INSERT INTO Customer VALUES ('C_35', 'Nitin Shivaprakash', 'M', 3, 283878, '1984-03-10', 1809939, 'NitinShivaprakash84@gmail.com', 9955012565);
INSERT INTO Customer VALUES ('C_36', 'Prabhas Rangaswamy', 'M', 13, 769925, '1984-04-24', 14726626, 'PrabhasRangaswamy84@gmail.com', 9968793036);
INSERT INTO Customer VALUES ('C_37', 'Kanak Vadlamani', 'M', 16, 551841, '1984-06-08', 459502, 'KanakVadlamani84@rediffmail.com', 9947896066);
INSERT INTO Customer VALUES ('C_38', 'Jainarayan Markandeya', 'M', 9, 328720, '1984-07-23', 8872690, 'JainarayanMarkandeya84@outlook.com', 9886599268);
INSERT INTO Customer VALUES ('C_39', 'Balagopal Narsi', 'M', 25, 346611, '1984-09-06', 14216703, 'BalagopalNarsi84@gmail.com', 9897164961);
INSERT INTO Customer VALUES ('C_40', 'Shantanu Kodumudi', 'M', 1, 441196, '1984-10-21', 15589302, 'ShantanuKodumudi84@yahoo.com', 9923811243);
INSERT INTO Customer VALUES ('C_41', 'Pratiti Surendar', 'M', 29, 572776, '1984-12-05', 15777088, 'PratitiSurendar84@yahoo.com', 9999321956);
INSERT INTO Customer VALUES ('C_42', 'Swagat Rekha', 'M', 25, 671563, '1985-01-19', 1098189, 'SwagatRekha85@gmail.com', 9886881495);
INSERT INTO Customer VALUES ('C_43', 'Oorjit Amulya Dehiya', 'M', 26, 547248, '1985-03-05', 8349486, 'OorjitAmulyaDehiya85@gmail.com', 9975368874);
INSERT INTO Customer VALUES ('C_44', 'Amogh Vandita', 'M', 25, 751803, '1985-04-19', 5514801, 'AmoghVandita85@gmail.com', 9988548584);
INSERT INTO Customer VALUES ('C_45', 'Raksha Kamraj', 'M', 27, 477112, '1985-06-03', 14604554, 'RakshaKamraj85@gmail.com', 9949311903);
INSERT INTO Customer VALUES ('C_46', 'Shubhang Chinmay', 'M', 15, 967737, '1985-07-18', 2950704, 'ShubhangChinmay85@gmail.com', 9991372588);
INSERT INTO Customer VALUES ('C_47', 'Preetish Kurapati', 'M', 30, 947665, '1985-09-01', 17183336, 'PreetishKurapati85@outlook.com', 9938571535);
INSERT INTO Customer VALUES ('C_48', 'Japendra Padmasola', 'M', 5, 910859, '1985-10-16', 6369734, 'JapendraPadmasola85@gmail.com', 9922147250);
INSERT INTO Customer VALUES ('C_49', 'Shrikrishna Konduru', 'M', 22, 534069, '1985-11-30', 9203954, 'ShrikrishnaKonduru85@outlook.com', 9878034070);
INSERT INTO Customer VALUES ('C_50', 'Praveen Mayekar', 'M', 6, 605480, '1986-01-14', 10229353, 'PraveenMayekar86@outlook.com', 9897137619);
INSERT INTO Customer VALUES ('C_51', 'Taral Phani', 'M', 29, 764603, '1986-02-28', 2548131, 'TaralPhani86@gmail.com', 9882191645);
INSERT INTO Customer VALUES ('C_52', 'Kanwaljeet Saeed', 'M', 22, 997191, '1986-04-14', 15283401, 'KanwaljeetSaeed86@gmail.com', 9989484616);
INSERT INTO Customer VALUES ('C_53', 'Drupad Bahl', 'M', 19, 186451, '1986-05-29', 17139690, 'DrupadBahl86@gmail.com', 9992457660);
INSERT INTO Customer VALUES ('C_54', 'Chirantan Virasana', 'M', 7, 102951, '1986-07-13', 10958298, 'ChirantanVirasana86@gmail.com', 9983315863);
INSERT INTO Customer VALUES ('C_55', 'Deependra Vanchinathan', 'M', 4, 272438, '1986-08-27', 18879382, 'DeependraVanchinathan86@gmail.com', 9983547502);
INSERT INTO Customer VALUES ('C_56', 'Panini Soumen', 'M', 9, 641715, '1986-10-11', 10191964, 'PaniniSoumen86@yahoo.com', 9974395735);
INSERT INTO Customer VALUES ('C_57', 'Janardan Soumitra', 'M', 27, 792302, '1986-11-25', 12765314, 'JanardanSoumitra86@yahoo.com', 9961547802);
INSERT INTO Customer VALUES ('C_58', 'Vineet Vidwans', 'M', 23, 693136, '1987-01-09', 2600051, 'VineetVidwans87@gmail.com', 9998978436);
INSERT INTO Customer VALUES ('C_59', 'Kanwalkishore Multani', 'M', 3, 389212, '1987-02-23', 953100, 'KanwalkishoreMultani87@rediffmail.com', 9900114067);
INSERT INTO Customer VALUES ('C_60', 'Ninad Koushika', 'M', 7, 239919, '1987-04-09', 1370380, 'NinadKoushika87@yahoo.com', 9878871599);
INSERT INTO Customer VALUES ('C_61', 'Balwant Shripati', 'M', 27, 212454, '1987-05-24', 14498289, 'BalwantShripati87@outlook.com', 9895341688);
INSERT INTO Customer VALUES ('C_62', 'Atmajyoti Nigam', 'M', 19, 995808, '1987-07-08', 9352835, 'AtmajyotiNigam87@outlook.com', 9929132931);
INSERT INTO Customer VALUES ('C_63', 'Gopichand Ujjwal', 'M', 21, 873157, '1987-08-22', 10835260, 'GopichandUjjwal87@outlook.com', 9966692484);
INSERT INTO Customer VALUES ('C_64', 'Rajyeshwar Kadowala', 'M', 10, 878493, '1987-10-06', 6983848, 'RajyeshwarKadowala87@outlook.com', 9909118214);
INSERT INTO Customer VALUES ('C_65', 'Vishram Keyur Prithviraj', 'M', 21, 400568, '1987-11-20', 14897739, 'VishramKeyurPrithviraj87@gmail.com', 9943941771);
INSERT INTO Customer VALUES ('C_66', 'Sudhanssu Ramamohan', 'M', 23, 766883, '1988-01-04', 1843643, 'SudhanssuRamamohan88@outlook.com', 9976722511);
INSERT INTO Customer VALUES ('C_67', 'Mayank Chhavvi', 'M', 2, 272743, '1988-02-18', 10548546, 'MayankChhavvi88@yahoo.com', 9974493947);
INSERT INTO Customer VALUES ('C_68', 'Tejeshwar Sagoo', 'M', 30, 961027, '1988-04-03', 10478403, 'TejeshwarSagoo88@outlook.com', 9967151911);
INSERT INTO Customer VALUES ('C_69', 'Prajin Dinesh Sunny', 'M', 27, 194599, '1988-05-18', 2488775, 'PrajinDineshSunny88@gmail.com', 9928346265);
INSERT INTO Customer VALUES ('C_70', 'Wali Vedati', 'M', 29, 805442, '1988-07-02', 7422755, 'WaliVedati88@gmail.com', 9958926841);
INSERT INTO Customer VALUES ('C_71', 'Om Meherhomji', 'M', 10, 767061, '1988-08-16', 6443948, 'OmMeherhomji88@gmail.com', 9904187962);
INSERT INTO Customer VALUES ('C_72', 'Yajnesh Mukti', 'M', 29, 821679, '1988-09-30', 5730708, 'YajneshMukti88@gmail.com', 9914180572);
INSERT INTO Customer VALUES ('C_73', 'Pariket Mihir', 'M', 25, 978978, '1988-11-14', 14217966, 'PariketMihir88@rediffmail.com', 9978236449);
INSERT INTO Customer VALUES ('C_74', 'Parikshit Kanetkar', 'M', 6, 741775, '1988-12-29', 2872140, 'ParikshitKanetkar88@outlook.com', 9897674371);
INSERT INTO Customer VALUES ('C_75', 'Mulkraj Vidya', 'M', 10, 805392, '1989-02-12', 16161944, 'MulkrajVidya89@rediffmail.com', 9898858615);
INSERT INTO Customer VALUES ('C_76', 'Nidhish Yashpal Mohanty', 'M', 23, 122883, '1989-03-29', 15089950, 'NidhishYashpalMohanty89@outlook.com', 9991353919);
INSERT INTO Customer VALUES ('C_77', 'Saroj Radhakrishna Mallika', 'M', 6, 385373, '1989-05-13', 14578059, 'SarojRadhakrishnaMallika89@outlook.com', 9941119806);
INSERT INTO Customer VALUES ('C_78', 'Gangol Shaik', 'M', 2, 325959, '1989-06-27', 9459291, 'GangolShaik89@outlook.com', 9977142932);
INSERT INTO Customer VALUES ('C_79', 'Parijat Chandrasekar', 'M', 10, 804845, '1989-08-11', 11777832, 'ParijatChandrasekar89@rediffmail.com', 9927477867);
INSERT INTO Customer VALUES ('C_80', 'Mitra Sundaramoorthy', 'M', 18, 143386, '1989-09-25', 4970147, 'MitraSundaramoorthy89@outlook.com', 9925176201);
INSERT INTO Customer VALUES ('C_81', 'Jag Vallurupalli', 'M', 2, 226523, '1989-11-09', 9806059, 'JagVallurupalli89@outlook.com', 9959871700);
INSERT INTO Customer VALUES ('C_82', 'Bankim Kurinji', 'M', 23, 485845, '1989-12-24', 7299688, 'BankimKurinji89@outlook.com', 9962442479);
INSERT INTO Customer VALUES ('C_83', 'Tahir Sahni', 'M', 4, 893221, '1990-02-07', 10048031, 'TahirSahni90@yahoo.com', 9918522037);
INSERT INTO Customer VALUES ('C_84', 'Faiyaz Madhana', 'M', 24, 676291, '1990-03-24', 1889103, 'FaiyazMadhana90@outlook.com', 9976862330);
INSERT INTO Customer VALUES ('C_85', 'Shubhang Amra', 'M', 29, 612467, '1990-05-08', 17137307, 'ShubhangAmra90@yahoo.com', 9931232483);
INSERT INTO Customer VALUES ('C_86', 'Jogindra Tyagi', 'M', 27, 325728, '1990-06-22', 7535236, 'JogindraTyagi90@yahoo.com', 9944627668);
INSERT INTO Customer VALUES ('C_87', 'Mandeep Thundyil', 'M', 5, 390580, '1990-08-06', 8608890, 'MandeepThundyil90@outlook.com', 9994751361);
INSERT INTO Customer VALUES ('C_88', 'Shrikrishna Malipeddi', 'M', 13, 973309, '1990-09-20', 17600559, 'ShrikrishnaMalipeddi90@gmail.com', 9986320031);
INSERT INTO Customer VALUES ('C_89', 'Ashu Chandiramani', 'M', 4, 581349, '1990-11-04', 5089180, 'AshuChandiramani90@outlook.com', 9951262911);
INSERT INTO Customer VALUES ('C_90', 'Indrayani Tyagi', 'F', 7, 792573, '1990-12-19', 5292639, 'IndrayaniTyagi90@gmail.com', 9971753025);
INSERT INTO Customer VALUES ('C_91', 'Akshaya Battacharjee', 'F', 9, 307470, '1991-02-02', 14726889, 'AkshayaBattacharjee91@outlook.com', 9912708162);
INSERT INTO Customer VALUES ('C_92', 'Indu Sangam', 'F', 9, 391007, '1991-03-19', 16429058, 'InduSangam91@outlook.com', 9978922205);
INSERT INTO Customer VALUES ('C_93', 'Rijuta Dasgupta', 'F', 25, 188045, '1991-05-03', 15551606, 'RijutaDasgupta91@outlook.com', 9917731854);
INSERT INTO Customer VALUES ('C_94', 'Induja Ruma Krishnamurthy', 'F', 15, 945329, '1991-06-17', 14154837, 'IndujaRumaKrishnamurthy91@gmail.com', 9941390417);
INSERT INTO Customer VALUES ('C_95', 'Shraddha Sawalha', 'F', 12, 400370, '1991-08-01', 1158796, 'ShraddhaSawalha91@gmail.com', 9990586626);
INSERT INTO Customer VALUES ('C_96', 'Kunda Konkar', 'F', 28, 217644, '1991-09-15', 3892396, 'KundaKonkar91@rediffmail.com', 9998647532);
INSERT INTO Customer VALUES ('C_97', 'Jasodhara Shail', 'F', 26, 633018, '1991-10-30', 19277532, 'JasodharaShail91@outlook.com', 9996374795);
INSERT INTO Customer VALUES ('C_98', 'Utpala Sangita', 'F', 14, 424717, '1991-12-14', 13560270, 'UtpalaSangita91@gmail.com', 9980457723);
INSERT INTO Customer VALUES ('C_99', 'Fajyaz Sankait', 'F', 21, 965625, '1992-01-28', 15852698, 'FajyazSankait92@gmail.com', 9979736924);
INSERT INTO Customer VALUES ('C_100', 'Rati Vidya', 'F', 30, 285029, '1992-03-13', 10384412, 'RatiVidya92@gmail.com', 9973648909);
INSERT INTO Customer VALUES ('C_101', 'Bhagya Chirimar', 'F', 11, 681094, '1992-04-27', 14795076, 'BhagyaChirimar92@outlook.com', 9976562202);
INSERT INTO Customer VALUES ('C_102', 'Amrusha Imani', 'F', 23, 135785, '1992-06-11', 11738853, 'AmrushaImani92@outlook.com', 9991260301);
INSERT INTO Customer VALUES ('C_103', 'Hiral Shamsher', 'F', 19, 872008, '1992-07-26', 6605486, 'HiralShamsher92@gmail.com', 9967324302);
INSERT INTO Customer VALUES ('C_104', 'Najma Bhaskar', 'F', 25, 198854, '1992-09-09', 12291272, 'NajmaBhaskar92@gmail.com', 9893809634);
INSERT INTO Customer VALUES ('C_105', 'Indukala Ramana', 'F', 28, 115225, '1992-10-24', 7204036, 'IndukalaRamana92@gmail.com', 9950795127);
INSERT INTO Customer VALUES ('C_106', 'Komal Vinata', 'F', 9, 623610, '1992-12-08', 9700216, 'KomalVinata92@yahoo.com', 9913137741);
INSERT INTO Customer VALUES ('C_107', 'Bimala Pundarik', 'F', 25, 228987, '1993-01-22', 1189757, 'BimalaPundarik93@yahoo.com', 9972051368);
INSERT INTO Customer VALUES ('C_108', 'Shabari Jeevan', 'F', 19, 453074, '1993-03-08', 9027324, 'ShabariJeevan93@gmail.com', 9964612776);
INSERT INTO Customer VALUES ('C_109', 'Shrigeeta Supriya', 'F', 9, 193905, '1993-04-22', 12173006, 'ShrigeetaSupriya93@gmail.com', 9967650845);
INSERT INTO Customer VALUES ('C_110', 'Magana Priyavardhan', 'F', 19, 843719, '1993-06-06', 14408876, 'MaganaPriyavardhan93@gmail.com', 9907408028);
INSERT INTO Customer VALUES ('C_111', 'Daya Jitesh', 'F', 15, 162910, '1993-07-21', 11472757, 'DayaJitesh93@gmail.com', 9942233078);
INSERT INTO Customer VALUES ('C_112', 'Ekata Mathrubootham', 'F', 26, 129191, '1993-09-04', 9301923, 'EkataMathrubootham93@yahoo.com', 9944593893);
INSERT INTO Customer VALUES ('C_113', 'Nitya Ketaki', 'F', 21, 932511, '1993-10-19', 4919316, 'NityaKetaki93@gmail.com', 9983654826);
INSERT INTO Customer VALUES ('C_114', 'Nityapriya Venktesh', 'F', 7, 803094, '1993-12-03', 19612676, 'NityapriyaVenktesh93@outlook.com', 9897187154);
INSERT INTO Customer VALUES ('C_115', 'Akuti Lokhande', 'F', 9, 126519, '1994-01-17', 12672311, 'AkutiLokhande94@gmail.com', 9879716358);
INSERT INTO Customer VALUES ('C_116', 'Swasti Satyen', 'F', 2, 819612, '1994-03-03', 4266579, 'SwastiSatyen94@gmail.com', 9908104121);
INSERT INTO Customer VALUES ('C_117', 'Jayani Jayati Maruti', 'F', 22, 408651, '1994-04-17', 8832567, 'JayaniJayatiMaruti94@gmail.com', 9995810352);
INSERT INTO Customer VALUES ('C_118', 'Latika Lolaksi', 'F', 5, 875098, '1994-06-01', 11234939, 'LatikaLolaksi94@rediffmail.com', 9942393973);
INSERT INTO Customer VALUES ('C_119', 'Ashakiran Sarath', 'F', 30, 698562, '1994-07-16', 18929462, 'AshakiranSarath94@gmail.com', 9929962062);
INSERT INTO Customer VALUES ('C_120', 'Poornachandra Sameer', 'M', 17, 455851, '1994-08-30', 1842141, 'PoornachandraSameer94@yahoo.com', 9966512251);
INSERT INTO Customer VALUES ('C_121', 'Udayachal Venu', 'M', 16, 399493, '1994-10-14', 19693527, 'UdayachalVenu94@yahoo.com', 9969469242);
INSERT INTO Customer VALUES ('C_122', 'Bratindra Dhadda', 'M', 1, 872214, '1994-11-28', 11997454, 'BratindraDhadda94@gmail.com', 9890247136);
INSERT INTO Customer VALUES ('C_123', 'Gursharan Thyagarajan', 'M', 17, 839733, '1995-01-12', 5824745, 'GursharanThyagarajan95@outlook.com', 9905463665);
INSERT INTO Customer VALUES ('C_124', 'Hemendu Rammohan', 'M', 26, 266864, '1995-02-26', 2688628, 'HemenduRammohan95@yahoo.com', 9955246057);
INSERT INTO Customer VALUES ('C_125', 'Indukanta Siddhanta Susarla', 'M', 16, 195126, '1995-04-12', 11943662, 'IndukantaSiddhantaSusarla95@outlook.com', 9962420359);
INSERT INTO Customer VALUES ('C_126', 'Kamlesh Nandkeolyar', 'M', 12, 794164, '1995-05-27', 15810511, 'KamleshNandkeolyar95@gmail.com', 9970848217);
INSERT INTO Customer VALUES ('C_127', 'Tuhin Sunthari', 'M', 7, 558791, '1995-07-11', 3324864, 'TuhinSunthari95@outlook.com', 9932984367);
INSERT INTO Customer VALUES ('C_128', 'Sudhakar Padmanabh', 'M', 26, 140659, '1995-08-25', 1955699, 'SudhakarPadmanabh95@outlook.com', 9899363524);
INSERT INTO Customer VALUES ('C_129', 'Isar Kunwarjit', 'M', 4, 996094, '1995-10-09', 11176622, 'IsarKunwarjit95@rediffmail.com', 9969457015);
INSERT INTO Customer VALUES ('C_130', 'Eshwar Vishwamber', 'M', 23, 655821, '1995-11-23', 3647905, 'EshwarVishwamber95@gmail.com', 9925775555);
INSERT INTO Customer VALUES ('C_131', 'Prateek Kandathil', 'M', 28, 108393, '1996-01-07', 1718737, 'PrateekKandathil96@gmail.com', 9969420072);
INSERT INTO Customer VALUES ('C_132', 'Chitraksh Manandhar', 'M', 28, 413141, '1996-02-21', 16139673, 'ChitrakshManandhar96@gmail.com', 9935048529);
INSERT INTO Customer VALUES ('C_133', 'Pushpak Sanjna', 'M', 6, 195620, '1996-04-06', 4351485, 'PushpakSanjna96@yahoo.com', 9929050278);
INSERT INTO Customer VALUES ('C_134', 'Adhik Prasad', 'M', 7, 639240, '1996-05-21', 1118902, 'AdhikPrasad96@yahoo.com', 9902024037);
INSERT INTO Customer VALUES ('C_135', 'Basudha Manjari', 'M', 14, 774081, '1996-07-05', 4786705, 'BasudhaManjari96@gmail.com', 9890514200);
INSERT INTO Customer VALUES ('C_136', 'Yaman Senapathy', 'M', 31, 462166, '1996-08-19', 15873354, 'YamanSenapathy96@outlook.com', 9967555344);
INSERT INTO Customer VALUES ('C_137', 'Ritvik Keskar', 'M', 27, 867333, '1996-10-03', 1768595, 'RitvikKeskar96@rediffmail.com', 9958682890);
INSERT INTO Customer VALUES ('C_138', 'Amar Ramasubramanian', 'M', 23, 607223, '1996-11-17', 19755841, 'AmarRamasubramanian96@outlook.com', 9985721916);
INSERT INTO Customer VALUES ('C_139', 'Banbihari Supriya', 'M', 26, 641771, '1997-01-01', 2343894, 'BanbihariSupriya97@gmail.com', 9894000661);
INSERT INTO Customer VALUES ('C_140', 'Vikramendra Tanuj Vishal', 'M', 15, 741932, '1997-02-15', 2887855, 'VikramendraTanujVishal97@yahoo.com', 9996324000);
INSERT INTO Customer VALUES ('C_141', 'Madhusudan Veerasamy', 'M', 7, 727983, '1997-04-01', 602349, 'MadhusudanVeerasamy97@outlook.com', 9958628615);
INSERT INTO Customer VALUES ('C_142', 'Sohail Mandava', 'M', 10, 562013, '1997-05-16', 13155183, 'SohailMandava97@gmail.com', 9976256540);
INSERT INTO Customer VALUES ('C_143', 'Suryabhan Niten', 'M', 18, 829231, '1997-06-30', 13608562, 'SuryabhanNiten97@gmail.com', 9987614256);
INSERT INTO Customer VALUES ('C_144', 'Neelambar Jagarlamudi', 'M', 22, 353062, '1997-08-14', 9110980, 'NeelambarJagarlamudi97@gmail.com', 9883402415);
INSERT INTO Customer VALUES ('C_145', 'Vrishin Yash Nayudu', 'M', 3, 621151, '1997-09-28', 6351278, 'VrishinYashNayudu97@rediffmail.com', 9949198153);
INSERT INTO Customer VALUES ('C_146', 'Yatindra Saini', 'M', 15, 132022, '1997-11-12', 9141451, 'YatindraSaini97@gmail.com', 9898166446);
INSERT INTO Customer VALUES ('C_147', 'Shripati Suthar', 'M', 13, 845263, '1997-12-27', 7568458, 'ShripatiSuthar97@outlook.com', 9945375559);
INSERT INTO Customer VALUES ('C_148', 'Raj Trilochan Satyavati', 'M', 13, 807112, '1998-02-10', 7504602, 'RajTrilochanSatyavati98@outlook.com', 9912805151);
INSERT INTO Customer VALUES ('C_149', 'Baldev Davuluri', 'M', 7, 772857, '1998-03-27', 19144334, 'BaldevDavuluri98@outlook.com', 9982480636);
INSERT INTO Customer VALUES ('C_150', 'Gayatri Sethi', 'F', 7, 921958, '1998-05-11', 16867641, 'GayatriSethi98@gmail.com', 9877135765);

INSERT INTO Item VALUES ('Item_1', 'Aquarium Blue', 'Oil Paint', 293);
INSERT INTO Item VALUES ('Item_2', 'Pale Green', 'Oil Paint', 347);
INSERT INTO Item VALUES ('Item_3', 'Soft Green', 'Oil Paint', 476);
INSERT INTO Item VALUES ('Item_4', 'Noen Pink', 'Oil Paint', 391);
INSERT INTO Item VALUES ('Item_5', 'Off White', 'Oil Paint', 462);
INSERT INTO Item VALUES ('Item_6', 'Dusty Purple', 'Oil Paint', 260);
INSERT INTO Item VALUES ('Item_7', 'Soft Purple', 'Oil Paint', 282);
INSERT INTO Item VALUES ('Item_8', 'Soft Blue', 'Oil Paint', 416);
INSERT INTO Item VALUES ('Item_9', 'Soft Pink', 'Emulsion Paint', 227);
INSERT INTO Item VALUES ('Item_10', 'Grape', 'Emulsion Paint', 224);
INSERT INTO Item VALUES ('Item_11', 'Velvet', 'Emulsion Paint', 229);
INSERT INTO Item VALUES ('Item_12', 'Soft Orange', 'Emulsion Paint', 242);
INSERT INTO Item VALUES ('Item_13', 'Navy Blue', 'Emulsion Paint', 244);
INSERT INTO Item VALUES ('Item_14', 'Cream', 'Emulsion Paint', 244);
INSERT INTO Item VALUES ('Item_15', 'Classic Gray', 'Emulsion Paint', 217);
INSERT INTO Item VALUES ('Item_16', 'White', 'Emulsion Paint', 206);
INSERT INTO Item VALUES ('Item_17', 'Mellow Yellow', 'Emulsion Paint', 228);
INSERT INTO Item VALUES ('Item_18', 'Bright Red', 'Emulsion Paint', 226);
INSERT INTO Item VALUES ('Item_19', 'Soft Red', 'Oil Paint', 316);
INSERT INTO Item VALUES ('Item_20', 'Bright Turquoise', 'Oil Paint', 510);
INSERT INTO Item VALUES ('Item_21', 'Plum', 'Oil Paint', 323);
INSERT INTO Item VALUES ('Item_22', 'Sage Green', 'Enamel Paint', 637);
INSERT INTO Item VALUES ('Item_23', 'Flat Black', 'Enamel Paint', 800);
INSERT INTO Item VALUES ('Item_24', 'Royal Blue', 'Enamel Paint', 514);
INSERT INTO Item VALUES ('Item_25', 'Cocoa', 'Enamel Paint', 509);
INSERT INTO Item VALUES ('Item_26', 'Army Green', 'Enamel Paint', 539);
INSERT INTO Item VALUES ('Item_27', 'Coral', 'Enamel Paint', 601);
INSERT INTO Item VALUES ('Item_28', 'Deep Teal', 'Anti-Corrosive Paint', 376);
INSERT INTO Item VALUES ('Item_29', 'Sky Blue', 'Anti-Corrosive Paint', 343);
INSERT INTO Item VALUES ('Item_30', 'Cream', 'Synthetic paint', 433);
INSERT INTO Item VALUES ('Item_31', 'Classic Gray', 'Synthetic paint', 296);
INSERT INTO Item VALUES ('Item_32', 'White', 'Synthetic paint', 247);
INSERT INTO Item VALUES ('Item_33', 'Mellow Yellow', 'Synthetic paint', 340);
INSERT INTO Item VALUES ('Item_34', 'Bright Red', 'Synthetic paint', 525);
INSERT INTO Item VALUES ('Item_35', 'Soft Red', 'Synthetic paint', 272);
INSERT INTO Item VALUES ('Item_36', 'Bright Turquoise', 'Synthetic paint', 579);
INSERT INTO Item VALUES ('Item_37', 'Plum', 'Synthetic paint', 221);
INSERT INTO Item VALUES ('Item_38', 'Sage Green', 'Synthetic paint', 305);
INSERT INTO Item VALUES ('Item_39', 'Flat Black', 'Synthetic paint', 502);
INSERT INTO Item VALUES ('Item_40', 'Royal Blue', 'Synthetic paint', 377);
INSERT INTO Item VALUES ('Item_41', 'Coral', 'Synthetic paint', 566);
INSERT INTO Item VALUES ('Item_42', 'Soft Pink', 'Oil Paint', 564);
INSERT INTO Item VALUES ('Item_43', 'Grape', 'Oil Paint', 264);
INSERT INTO Item VALUES ('Item_44', 'Velvet', 'Oil Paint', 353);
INSERT INTO Item VALUES ('Item_45', 'Soft Orange', 'Oil Paint', 483);
INSERT INTO Item VALUES ('Item_46', 'Navy Blue', 'Oil Paint', 520);
INSERT INTO Item VALUES ('Item_47', 'Cream', 'Oil Paint', 329);
INSERT INTO Item VALUES ('Item_48', 'Classic Gray', 'Oil Paint', 597);
INSERT INTO Item VALUES ('Item_49', 'Cream', 'Anti-Corrosive Paint', 267);
INSERT INTO Item VALUES ('Item_50', 'Classic Gray', 'Anti-Corrosive Paint', 333);
INSERT INTO Item VALUES ('Item_51', 'White', 'Anti-Corrosive Paint', 513);
INSERT INTO Item VALUES ('Item_52', 'Mellow Yellow', 'Anti-Corrosive Paint', 467);
INSERT INTO Item VALUES ('Item_53', 'Bright Red', 'Anti-Corrosive Paint', 250);
INSERT INTO Item VALUES ('Item_54', 'Soft Red', 'Anti-Corrosive Paint', 326);
INSERT INTO Item VALUES ('Item_55', 'Bright Turquoise', 'Anti-Corrosive Paint', 428);
INSERT INTO Item VALUES ('Item_56', 'Noen Pink', 'Anti-Corrosive Paint', 599);
INSERT INTO Item VALUES ('Item_57', 'Off White', 'Anti-Corrosive Paint', 427);
INSERT INTO Item VALUES ('Item_58', 'Dusty Purple', 'Anti-Corrosive Paint', 553);
INSERT INTO Item VALUES ('Item_59', 'Soft Purple', 'Anti-Corrosive Paint', 506);
INSERT INTO Item VALUES ('Item_60', 'Coral', 'Anti-Corrosive Paint', 329);
INSERT INTO Item VALUES ('Item_61', 'Aquarium Blue', 'Anti-Corrosive Paint', 495);

INSERT INTO Campaign VALUES ('CiD1', 'Product Launch', '2019-01-01', '2019-01-31');
INSERT INTO Campaign VALUES ('CiD2', 'Brand Awareness', '2019-12-01', '2019-12-31');
INSERT INTO Campaign VALUES ('CiD3', 'Seasonal Push', '2020-07-01', '2020-07-30');
INSERT INTO Campaign VALUES ('CiD4', 'Brand Awareness', '2020-12-01', '2020-12-31');
INSERT INTO Campaign VALUES ('CiD5', 'Rebranding campaign', '2021-07-01', '2021-07-30');
INSERT INTO Campaign VALUES ('CiD6', 'Seasonal Push', '2022-12-01', '2022-12-31');

INSERT INTO CouponMapping VALUES ('NL801', 'Item_1', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('KY129', 'Item_2', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('NH787', 'Item_3', 'Flat', 2000, 10999, 15);
INSERT INTO CouponMapping VALUES ('PW234', 'Item_4', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('SB928', 'Item_22', 'Flat', 4000, 15999, 15);
INSERT INTO CouponMapping VALUES ('LK921', 'Item_23', 'Flat', 2000, 10999, 90);
INSERT INTO CouponMapping VALUES ('KF549', 'Item_24', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('WV837', 'Item_25', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('WM681', 'Item_26', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('PK238', 'Item_27', 'Percent', 10, 3499, 30);
INSERT INTO CouponMapping VALUES ('FB617', 'Item_28', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('GE725', 'Item_29', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('EL791', 'Item_30', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('JT337', 'Item_31', 'Flat', 4000, 15999, 15);
INSERT INTO CouponMapping VALUES ('PW860', 'Item_32', 'Percent', 10, 3499, 30);
INSERT INTO CouponMapping VALUES ('RX760', 'Item_33', 'Percent', 5, 1999, 90);
INSERT INTO CouponMapping VALUES ('PV938', 'Item_34', 'Flat', 4000, 15999, 15);
INSERT INTO CouponMapping VALUES ('BU774', 'Item_35', 'Percent', 10, 3499, 30);
INSERT INTO CouponMapping VALUES ('JD988', 'Item_36', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('PB513', 'Item_37', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('JT255', 'Item_38', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('BS289', 'Item_39', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('RJ385', 'Item_56', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('AN108', 'Item_57', 'Percent', 10, 3499, 15);
INSERT INTO CouponMapping VALUES ('EB323', 'Item_58', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('SF700', 'Item_59', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('QE564', 'Item_60', 'Percent', 5, 1999, 90);
INSERT INTO CouponMapping VALUES ('MS789', 'Item_61', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('QZ790', 'Item_5', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('NH867', 'Item_6', 'Percent', 10, 3499, 15);
INSERT INTO CouponMapping VALUES ('QG411', 'Item_7', 'Percent', 10, 3499, 30);
INSERT INTO CouponMapping VALUES ('EM849', 'Item_8', 'Percent', 10, 3499, 30);
INSERT INTO CouponMapping VALUES ('WQ890', 'Item_9', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('IJ213', 'Item_10', 'Flat', 4000, 15999, 15);
INSERT INTO CouponMapping VALUES ('SU548', 'Item_11', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('YT396', 'Item_12', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('ZF881', 'Item_13', 'Percent', 10, 3499, 15);
INSERT INTO CouponMapping VALUES ('AG574', 'Item_14', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('US167', 'Item_15', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('VJ938', 'Item_16', 'Percent', 10, 3499, 90);
INSERT INTO CouponMapping VALUES ('KV471', 'Item_17', 'Percent', 10, 3499, 15);
INSERT INTO CouponMapping VALUES ('RB644', 'Item_18', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('JC942', 'Item_19', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('WV964', 'Item_20', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('UN570', 'Item_21', 'Percent', 5, 1999, 15);
INSERT INTO CouponMapping VALUES ('QV764', 'Item_40', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('OM287', 'Item_41', 'Percent', 10, 3499, 30);
INSERT INTO CouponMapping VALUES ('QI961', 'Item_42', 'Percent', 10, 3499, 30);
INSERT INTO CouponMapping VALUES ('MJ390', 'Item_43', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('OL924', 'Item_44', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('QD673', 'Item_45', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('IM781', 'Item_46', 'Flat', 4000, 15999, 30);
INSERT INTO CouponMapping VALUES ('RI775', 'Item_47', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('TQ340', 'Item_48', 'Percent', 5, 1999, 30);
INSERT INTO CouponMapping VALUES ('FX326', 'Item_49', 'Percent', 10, 3499, 15);
INSERT INTO CouponMapping VALUES ('LV898', 'Item_50', 'Flat', 2000, 10999, 30);
INSERT INTO CouponMapping VALUES ('RF170', 'Item_51', 'Flat', 4000, 15999, 15);
INSERT INTO CouponMapping VALUES ('DK117', 'Item_52', 'Flat', 4000, 15999, 90);
INSERT INTO CouponMapping VALUES ('CP880', 'Item_53', 'Percent', 5, 1999, 15);
INSERT INTO CouponMapping VALUES ('AD452', 'Item_54', 'Percent', 10, 3499, 15);
INSERT INTO CouponMapping VALUES ('RJ793', 'Item_55', 'Flat', 2000, 10999, 30);

INSERT INTO CustomerTransactionData VALUES ('TID00189', 'C_1', 'Item_55', 'CiD4', 'RJ793', 83, 33524.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00014', 'C_100', 'Item_27', 'CiD1', 'PK238', 214, 115752.6, '2019-01-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00290', 'C_100', 'Item_31', 'CiD6', 'JT337', 153, 41288.0, '2022-12-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00137', 'C_101', 'Item_49', null, null, 311, 83037.0, '2021-10-13', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00083', 'C_101', 'Item_8', null, 'EM849', 136, 50918.4, '2022-01-13', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00236', 'C_101', 'Item_31', null, 'JT337', 235, 65560.0, '2021-02-21', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00218', 'C_102', 'Item_60', null, null, 149, 67646.0, '2021-10-13', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00229', 'C_102', 'Item_49', null, null, 212, 76735.0, '2021-03-07', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00026', 'C_103', 'Item_60', null, null, 370, 167980.0, '2021-03-07', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00200', 'C_103', 'Item_49', null, null, 417, 214755.0, '2020-10-04', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00093', 'C_103', 'Item_43', null, 'MJ390', 381, 96584.0, '2021-04-08', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00257', 'C_103', 'Item_33', null, 'RX760', 208, 67184.0, '2022-08-06', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00081', 'C_104', 'Item_60', null, null, 246, 80934.0, '2022-08-04', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00190', 'C_104', 'Item_22', null, null, 450, 286650.0, '2020-05-25', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00006', 'C_105', 'Item_24', null, 'KF549', 206, 101884.0, '2021-07-06', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00209', 'C_105', 'Item_2', null, null, 240, 83280.0, '2022-04-26', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00277', 'C_105', 'Item_14', null, 'AG574', 444, 104336.0, '2021-04-02', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00274', 'C_106', 'Item_3', null, null, 177, 84252.0, '2021-10-23', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00082', 'C_106', 'Item_13', null, 'ZF881', 216, 47433.6, '2022-09-02', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00220', 'C_106', 'Item_32', null, 'PW860', 141, 31344.3, '2021-12-05', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00068', 'C_107', 'Item_51', null, 'RF170', 194, 95522.0, '2022-07-28', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00230', 'C_107', 'Item_58', null, 'EB323', 151, 81503.0, '2021-11-25', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00012', 'C_109', 'Item_51', null, null, 112, 57456.0, '2021-11-24', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00004', 'C_11', 'Item_13', null, null, 52, 12688.0, '2020-01-21', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00174', 'C_11', 'Item_59', null, 'SF700', 63, 30284.1, '2020-07-05', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00023', 'C_112', 'Item_48', null, 'TQ340', 264, 149727.6, '2022-11-16', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00182', 'C_112', 'Item_21', null, null, 284, 91732.0, '2022-10-03', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00110', 'C_112', 'Item_53', null, 'CP880', 81, 19237.5, '2020-01-07', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00146', 'C_112', 'Item_2', null, 'KY129', 308, 104876.0, '2021-03-09', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00020', 'C_113', 'Item_13', null, null, 93, 19902.0, '2021-11-01', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00028', 'C_113', 'Item_16', null, null, 402, 91254.0, '2021-11-01', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00118', 'C_113', 'Item_2', null, 'KY129', 233, 78851.0, '2022-08-21', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00156', 'C_114', 'Item_48', null, null, 151, 90147.0, '2021-07-16', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00157', 'C_114', 'Item_25', null, 'WV837', 215, 105435.0, '2022-09-22', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00199', 'C_114', 'Item_41', null, 'OM287', 166, 84560.4, '2021-11-28', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00291', 'C_115', 'Item_13', null, 'ZF881', 298, 65440.8, '2022-07-26', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00030', 'C_116', 'Item_2', null, null, 213, 73911.0, '2020-12-10', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00269', 'C_116', 'Item_6', null, 'NH867', 243, 56862.0, '2020-03-04', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00076', 'C_117', 'Item_17', null, null, 351, 80028.0, '2020-07-22', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00086', 'C_118', 'Item_2', null, 'KY129', 147, 49009.0, '2021-05-03', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00167', 'C_118', 'Item_55', null, null, 206, 88168.0, '2020-09-02', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00177', 'C_119', 'Item_18', null, null, 298, 67348.0, '2020-05-10', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00125', 'C_119', 'Item_46', null, 'IM781', 207, 103640.0, '2020-03-01', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00018', 'C_12', 'Item_43', null, null, 48, 12672.0, '2019-04-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00234', 'C_12', 'Item_29', 'CiD2', 'GE725', 83, 26469.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00300', 'C_12', 'Item_9', 'CiD1', 'WQ890', 70, 15095.5, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00027', 'C_120', 'Item_3', null, null, 294, 139944.0, '2021-07-09', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00168', 'C_120', 'Item_29', null, 'GE725', 386, 130398.0, '2021-07-13', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00213', 'C_120', 'Item_8', null, 'EM849', 340, 127296.0, '2021-04-22', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00265', 'C_120', 'Item_22', null, 'SB928', 126, 76262.0, '2020-12-19', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00266', 'C_120', 'Item_50', null, 'LV898', 278, 90574.0, '2021-01-18', 'Government');
INSERT INTO CustomerTransactionData VALUES ('TID00154', 'C_121', 'Item_60', 'CiD6', 'QE564', 84, 26254.2, '2023-03-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00196', 'C_121', 'Item_2', 'CiD4', 'KY129', 57, 17779.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00003', 'C_122', 'Item_2', 'CiD2', 'KY129', 55, 17085.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00175', 'C_122', 'Item_61', 'CiD4', 'MS789', 87, 40911.75, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00246', 'C_122', 'Item_4', 'CiD4', 'PW234', 68, 22588.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00284', 'C_122', 'Item_49', null, 'FX326', 38, 9131.4, '2020-01-19', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00075', 'C_124', 'Item_56', 'CiD1', 'RJ385', 61, 34712.05, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00085', 'C_124', 'Item_8', 'CiD3', 'EM849', 91, 34070.4, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00090', 'C_124', 'Item_24', 'CiD4', 'KF549', 29, 14906.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00188', 'C_124', 'Item_17', null, null, 64, 14592.0, '2019-01-27', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00224', 'C_124', 'Item_26', 'CiD6', 'WM681', 92, 47108.6, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00096', 'C_125', 'Item_26', 'CiD3', 'WM681', 50, 25602.5, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00289', 'C_125', 'Item_18', 'CiD6', 'RB644', 88, 18893.6, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00053', 'C_127', 'Item_3', 'CiD6', 'NH787', 50, 21800.0, '2022-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00072', 'C_127', 'Item_36', 'CiD4', 'JD988', 52, 28108.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00219', 'C_127', 'Item_39', 'CiD5', 'BS289', 30, 13060.0, '2021-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00275', 'C_127', 'Item_56', 'CiD4', 'RJ385', 40, 44038.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00285', 'C_127', 'Item_22', 'CiD3', 'SB928', 50, 27850.0, '2020-07-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00099', 'C_128', 'Item_49', null, null, 49, 13083.0, '2020-04-04', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00065', 'C_129', 'Item_49', 'CiD1', 'FX326', 72, 17301.6, '2019-01-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00191', 'C_129', 'Item_51', 'CiD4', 'RF170', 47, 20111.0, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00270', 'C_129', 'Item_2', 'CiD3', 'KY129', 81, 26107.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00011', 'C_13', 'Item_21', null, null, 67, 21641.0, '2022-11-27', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00113', 'C_13', 'Item_18', 'CiD4', 'RB644', 96, 20611.2, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00221', 'C_13', 'Item_60', 'CiD4', 'QE564', 85, 26566.75, '2021-03-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00057', 'C_130', 'Item_28', null, 'FB617', 83, 29647.6, '2021-12-05', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00088', 'C_130', 'Item_12', 'CiD3', 'YT396', 90, 20691.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00176', 'C_130', 'Item_61', null, null, 26, 12870.0, '2019-07-02', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00253', 'C_130', 'Item_44', 'CiD6', 'OL924', 74, 22122.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00104', 'C_131', 'Item_36', 'CiD6', 'JD988', 31, 15949.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00235', 'C_131', 'Item_16', null, null, 82, 18614.0, '2020-04-17', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00292', 'C_131', 'Item_13', null, null, 37, 9028.0, '2020-04-17', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00171', 'C_132', 'Item_44', null, 'OL924', 43, 15179.0, '2021-10-27', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00240', 'C_132', 'Item_10', 'CiD1', 'IJ213', 52, 11648.0, '2019-01-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00005', 'C_133', 'Item_16', 'CiD3', 'VJ938', 46, 8528.4, '2020-09-29', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00232', 'C_133', 'Item_30', null, null, 93, 40269.0, '2022-07-23', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00273', 'C_135', 'Item_16', 'CiD3', 'VJ938', 40, 7416.0, '2020-09-29', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00280', 'C_135', 'Item_5', 'CiD6', 'QZ790', 92, 40504.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00254', 'C_136', 'Item_34', 'CiD1', 'PV938', 73, 34325.0, '2019-01-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00007', 'C_137', 'Item_13', null, 'ZF881', 54, 11858.4, '2022-11-13', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00010', 'C_137', 'Item_5', null, null, 40, 18480.0, '2022-04-21', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00067', 'C_138', 'Item_9', 'CiD6', 'WQ890', 27, 5822.55, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00071', 'C_138', 'Item_45', null, 'QD673', 79, 36157.0, '2021-03-19', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00087', 'C_138', 'Item_9', 'CiD4', 'WQ890', 49, 10566.85, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00139', 'C_138', 'Item_9', 'CiD6', 'WQ890', 100, 21565.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00152', 'C_139', 'Item_59', 'CiD2', 'SF700', 73, 35091.1, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00107', 'C_140', 'Item_6', 'CiD4', 'NH867', 68, 15912.0, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00115', 'C_140', 'Item_10', null, 'IJ213', 26, 5824.0, '2022-07-06', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00179', 'C_141', 'Item_38', 'CiD3', 'JT255', 43, 11115.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00245', 'C_141', 'Item_25', 'CiD6', 'WV837', 29, 14761.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00102', 'C_142', 'Item_8', null, null, 94, 39104.0, '2022-02-27', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00294', 'C_143', 'Item_43', 'CiD3', 'MJ390', 80, 17120.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00133', 'C_144', 'Item_23', 'CiD6', 'LK921', 93, 72400.0, '2023-03-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00203', 'C_144', 'Item_24', 'CiD4', 'KF549', 70, 31980.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00260', 'C_145', 'Item_3', 'CiD6', 'NH787', 86, 38936.0, '2022-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00063', 'C_146', 'Item_43', 'CiD2', 'MJ390', 81, 17384.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00256', 'C_146', 'Item_58', null, null, 77, 42581.0, '2020-05-13', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00164', 'C_146', 'Item_3', 'CiD6', 'NH787', 49, 21324.0, '2022-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00033', 'C_147', 'Item_21', 'CiD5', 'UN570', 47, 14421.95, '2021-07-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00124', 'C_147', 'Item_55', 'CiD2', 'RJ793', 80, 32240.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00047', 'C_147', 'Item_37', null, null, 92, 20332.0, '2020-06-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00143', 'C_148', 'Item_46', 'CiD4', 'IM781', 32, 12640.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00120', 'C_148', 'Item_13', null, null, 61, 13054.0, '2022-06-14', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00242', 'C_148', 'Item_16', null, null, 92, 20884.0, '2022-06-14', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00288', 'C_148', 'Item_31', 'CiD3', 'JT337', 96, 24416.0, '2020-07-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00297', 'C_148', 'Item_37', 'CiD4', 'PB513', 83, 14343.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00060', 'C_149', 'Item_24', 'CiD1', 'KF549', 53, 23242.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00070', 'C_149', 'Item_21', 'CiD4', 'UN570', 43, 13194.55, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00225', 'C_149', 'Item_44', 'CiD1', 'OL924', 41, 14473.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00126', 'C_15', 'Item_4', null, 'PW234', 94, 32754.0, '2022-10-04', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00150', 'C_15', 'Item_13', null, null, 41, 10004.0, '2021-08-07', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00259', 'C_15', 'Item_47', 'CiD2', 'RI775', 53, 16565.15, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00056', 'C_150', 'Item_47', 'CiD1', 'RI775', 29, 9063.95, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00140', 'C_150', 'Item_51', 'CiD4', 'RF170', 64, 28832.0, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00098', 'C_16', 'Item_13', null, null, 39, 14664.0, '2022-02-10', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00226', 'C_16', 'Item_16', null, null, 26, 13234.0, '2022-02-10', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00252', 'C_16', 'Item_45', 'CiD2', 'QD673', 69, 31327.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00282', 'C_17', 'Item_35', 'CiD2', 'BU774', 97, 23745.6, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00298', 'C_17', 'Item_12', 'CiD4', 'YT396', 89, 20461.1, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00042', 'C_18', 'Item_9', null, null, 47, 10669.0, '2021-05-20', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00214', 'C_18', 'Item_17', 'CiD5', 'KV471', 64, 13132.8, '2021-07-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00100', 'C_2', 'Item_39', 'CiD3', 'BS289', 78, 37156.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00134', 'C_20', 'Item_53', 'CiD6', 'CP880', 33, 7837.5, '2022-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00108', 'C_21', 'Item_5', 'CiD5', 'QZ790', 44, 18328.0, '2021-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00013', 'C_22', 'Item_24', 'CiD3', 'KF549', 58, 25812.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00183', 'C_22', 'Item_16', 'CiD6', 'VJ938', 87, 16129.8, '2023-03-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00046', 'C_23', 'Item_38', 'CiD3', 'JT255', 37, 9285.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00135', 'C_23', 'Item_11', 'CiD2', 'SU548', 46, 10534.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00185', 'C_23', 'Item_15', 'CiD2', 'US167', 56, 10152.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00262', 'C_23', 'Item_1', 'CiD3', 'NL801', 73, 17389.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00287', 'C_23', 'Item_31', 'CiD4', 'JT337', 54, 15984.0, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00158', 'C_24', 'Item_8', 'CiD1', 'EM849', 41, 15350.4, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00165', 'C_24', 'Item_59', 'CiD4', 'SF700', 69, 33168.3, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00114', 'C_25', 'Item_24', 'CiD5', 'KF549', 45, 19130.0, '2021-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00180', 'C_25', 'Item_26', 'CiD3', 'WM681', 56, 28674.8, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00169', 'C_26', 'Item_10', 'CiD5', 'IJ213', 76, 13024.0, '2021-07-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00239', 'C_26', 'Item_43', 'CiD1', 'MJ390', 31, 8184.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00293', 'C_27', 'Item_6', 'CiD4', 'NH867', 28, 6552.0, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00130', 'C_29', 'Item_29', null, null, 33, 11319.0, '2021-12-05', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00116', 'C_3', 'Item_47', 'CiD5', 'RI775', 61, 19065.55, '2021-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00195', 'C_3', 'Item_22', null, 'SB928', 75, 43775.0, '2019-08-26', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00197', 'C_30', 'Item_11', 'CiD4', 'SU548', 75, 15175.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00136', 'C_31', 'Item_15', 'CiD2', 'US167', 92, 17964.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00029', 'C_32', 'Item_41', 'CiD1', 'OM287', 80, 40752.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00201', 'C_32', 'Item_47', 'CiD1', 'RI775', 35, 7945.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00032', 'C_33', 'Item_45', 'CiD2', 'QD673', 51, 22633.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00037', 'C_33', 'Item_14', null, 'AG574', 25, 6100.0, '2020-11-06', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00080', 'C_33', 'Item_35', 'CiD6', 'BU774', 41, 10036.8, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00051', 'C_34', 'Item_51', 'CiD4', 'RF170', 85, 39605.0, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00050', 'C_34', 'Item_55', null, null, 75, 32100.0, '2020-05-28', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00237', 'C_34', 'Item_20', 'CiD6', 'WV964', 34, 16473.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00271', 'C_34', 'Item_22', 'CiD4', 'SB928', 94, 55878.0, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00074', 'C_35', 'Item_35', 'CiD1', 'BU774', 47, 11505.6, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00105', 'C_36', 'Item_13', null, null, 51, 12444.0, '2019-03-05', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00283', 'C_37', 'Item_47', 'CiD4', 'RI775', 79, 24691.45, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00178', 'C_39', 'Item_5', null, 'QZ790', 50, 21100.0, '2020-05-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00031', 'C_4', 'Item_16', 'CiD2', 'VJ938', 66, 12236.4, '2020-02-29', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00041', 'C_40', 'Item_45', 'CiD1', 'QD673', 72, 32776.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00045', 'C_40', 'Item_43', 'CiD5', 'MJ390', 40, 10560.0, '2021-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00202', 'C_40', 'Item_25', 'CiD3', 'WV837', 50, 21450.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00038', 'C_41', 'Item_48', null, 'TQ340', 45, 25521.75, '2020-08-17', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00131', 'C_41', 'Item_12', 'CiD6', 'YT396', 74, 17012.6, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00173', 'C_41', 'Item_52', 'CiD1', 'DK117', 35, 12345.0, '2019-04-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00091', 'C_41', 'Item_13', null, null, 57, 12198.0, '2020-01-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00247', 'C_41', 'Item_16', null, null, 35, 7945.0, '2020-01-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00112', 'C_42', 'Item_17', 'CiD1', 'KV471', 42, 8618.4, '2019-01-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00002', 'C_43', 'Item_23', null, 'LK921', 27, 19600.0, '2021-05-05', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00016', 'C_43', 'Item_43', null, 'MJ390', 28, 7392.0, '2021-09-19', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00019', 'C_43', 'Item_19', 'CiD1', 'JC942', 70, 18120.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00144', 'C_45', 'Item_34', 'CiD6', 'PV938', 67, 31175.0, '2022-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00163', 'C_46', 'Item_19', 'CiD6', 'JC942', 65, 16540.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00227', 'C_46', 'Item_51', 'CiD5', 'RF170', 29, 14877.0, '2021-07-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00061', 'C_47', 'Item_7', 'CiD1', 'QG411', 94, 23857.2, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00001', 'C_48', 'Item_24', 'CiD3', 'KF549', 99, 46886.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00141', 'C_48', 'Item_36', 'CiD4', 'JD988', 50, 26950.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00222', 'C_49', 'Item_26', null, null, 95, 51205.0, '2019-04-04', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00211', 'C_5', 'Item_32', null, null, 65, 16055.0, '2021-01-20', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00054', 'C_50', 'Item_53', 'CiD4', 'CP880', 79, 18762.5, '2020-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00268', 'C_50', 'Item_44', 'CiD4', 'OL924', 42, 14826.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00276', 'C_50', 'Item_52', 'CiD5', 'DK117', 43, 16081.0, '2021-09-29', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00161', 'C_51', 'Item_33', 'CiD1', 'RX760', 44, 14212.0, '2019-04-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00238', 'C_51', 'Item_13', null, null, 74, 15836.0, '2022-03-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00244', 'C_51', 'Item_16', null, null, 36, 8172.0, '2022-03-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00231', 'C_51', 'Item_25', null, 'WV837', 38, 15342.0, '2021-06-02', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00066', 'C_52', 'Item_50', 'CiD4', 'LV898', 75, 22975.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00186', 'C_52', 'Item_38', 'CiD1', 'JT255', 45, 11725.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00208', 'C_52', 'Item_8', 'CiD4', 'EM849', 55, 20592.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00043', 'C_52', 'Item_31', null, null, 63, 18648.0, '2019-03-25', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00142', 'C_53', 'Item_49', null, 'FX326', 47, 11294.1, '2021-02-03', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00251', 'C_53', 'Item_1', null, 'NL801', 96, 24128.0, '2019-06-19', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00145', 'C_54', 'Item_57', 'CiD6', 'AN108', 50, 19215.0, '2022-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00216', 'C_54', 'Item_30', 'CiD4', 'EL791', 45, 17485.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00121', 'C_55', 'Item_3', 'CiD6', 'NH787', 45, 19420.0, '2022-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00127', 'C_55', 'Item_22', 'CiD5', 'SB928', 52, 29124.0, '2021-07-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00255', 'C_55', 'Item_28', null, null, 30, 11280.0, '2021-09-05', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00008', 'C_56', 'Item_25', 'CiD3', 'WV837', 42, 17378.0, '2020-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00079', 'C_57', 'Item_33', 'CiD1', 'RX760', 77, 24871.0, '2019-04-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00198', 'C_57', 'Item_24', 'CiD2', 'KF549', 82, 38148.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00193', 'C_58', 'Item_2', 'CiD2', 'KY129', 84, 27148.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00261', 'C_58', 'Item_34', 'CiD1', 'PV938', 81, 38525.0, '2019-01-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00095', 'C_59', 'Item_20', 'CiD6', 'WV964', 59, 28585.5, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00106', 'C_6', 'Item_30', 'CiD1', 'EL791', 68, 27444.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00122', 'C_62', 'Item_12', null, null, 74, 17908.0, '2020-02-15', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00025', 'C_63', 'Item_14', 'CiD4', 'AG574', 45, 10980.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00036', 'C_63', 'Item_35', 'CiD4', 'BU774', 58, 14198.4, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00064', 'C_63', 'Item_52', 'CiD3', 'DK117', 46, 17482.0, '2020-09-29', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00094', 'C_63', 'Item_1', 'CiD1', 'NL801', 33, 9669.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00132', 'C_63', 'Item_37', 'CiD6', 'PB513', 36, 7956.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00159', 'C_63', 'Item_61', 'CiD4', 'MS789', 93, 43733.25, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00162', 'C_63', 'Item_4', 'CiD4', 'PW234', 40, 15640.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00194', 'C_63', 'Item_36', 'CiD2', 'JD988', 35, 18265.0, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00250', 'C_63', 'Item_35', 'CiD1', 'BU774', 77, 18849.6, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00055', 'C_64', 'Item_40', 'CiD6', 'QV764', 49, 14473.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00205', 'C_64', 'Item_20', 'CiD1', 'WV964', 86, 41667.0, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00059', 'C_66', 'Item_28', 'CiD1', 'FB617', 71, 25361.2, '2019-01-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00206', 'C_66', 'Item_55', 'CiD5', 'RJ793', 28, 9984.0, '2021-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00248', 'C_66', 'Item_23', 'CiD4', 'LK921', 25, 18000.0, '2021-03-01', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00039', 'C_67', 'Item_57', 'CiD6', 'AN108', 38, 14603.4, '2022-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00103', 'C_68', 'Item_60', 'CiD5', 'QE564', 40, 12502.0, '2021-09-29', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00024', 'C_68', 'Item_17', null, null, 36, 8208.0, '2022-04-08', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00172', 'C_69', 'Item_21', 'CiD2', 'UN570', 90, 27616.5, '2019-12-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00184', 'C_69', 'Item_32', 'CiD4', 'PW860', 48, 10670.4, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00129', 'C_7', 'Item_36', 'CiD4', 'JD988', 64, 35056.0, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00212', 'C_7', 'Item_34', 'CiD1', 'PV938', 40, 17000.0, '2019-01-16', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00138', 'C_70', 'Item_28', 'CiD6', 'FB617', 94, 33576.8, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00149', 'C_70', 'Item_42', 'CiD5', 'QI961', 31, 15735.6, '2021-07-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00217', 'C_70', 'Item_42', 'CiD4', 'QI961', 96, 48729.6, '2020-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00295', 'C_70', 'Item_35', null, 'BU774', 93, 22766.4, '2020-12-10', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00148', 'C_71', 'Item_30', 'CiD2', 'EL791', 177, 74641.0, '2019-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00192', 'C_71', 'Item_22', 'CiD4', 'SB928', 71, 41227.0, '2020-12-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00223', 'C_71', 'Item_41', 'CiD4', 'OM287', 245, 8172.0, '2020-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00078', 'C_72', 'Item_12', 'CiD6', 'YT396', 119, 27358.1, '2022-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00243', 'C_72', 'Item_5', 'CiD1', 'QZ790', 129, 57598.0, '2019-01-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00022', 'C_73', 'Item_2', null, 'KY129', 164, 54908.0, '2020-12-09', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00155', 'C_73', 'Item_44', 'CiD2', 'OL924', 140, 45420.0, '2019-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00101', 'C_73', 'Item_4', null, null, 62, 24242.0, '2022-10-13', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00299', 'C_74', 'Item_25', 'CiD2', 'WV837', 120, 57080.0, '2019-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00119', 'C_75', 'Item_36', null, null, 127, 73533.0, '2021-09-05', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00258', 'C_75', 'Item_4', 'CiD3', 'PW234', 95, 33145.0, '2020-07-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00278', 'C_75', 'Item_10', 'CiD5', 'IJ213', 63, 14112.0, '2021-07-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00151', 'C_76', 'Item_40', 'CiD6', 'QV764', 92, 30684.0, '2022-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00210', 'C_76', 'Item_32', null, 'PW860', 144, 32011.2, '2022-05-21', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00097', 'C_77', 'Item_12', 'CiD6', 'YT396', 112, 25748.8, '2022-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00281', 'C_77', 'Item_59', 'CiD6', 'SF700', 64, 30764.8, '2022-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00073', 'C_78', 'Item_31', 'CiD1', 'JT337', 249, 69704.0, '2019-01-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00279', 'C_78', 'Item_7', 'CiD5', 'QG411', 223, 56597.4, '2021-07-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00286', 'C_78', 'Item_52', 'CiD6', 'DK117', 104, 44568.0, '2023-03-01', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00044', 'C_79', 'Item_6', 'CiD4', 'NH867', 87, 20358.0, '2020-12-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00077', 'C_79', 'Item_35', 'CiD3', 'BU774', 98, 23990.4, '2020-07-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00160', 'C_8', 'Item_8', 'CiD2', 'EM849', 64, 23961.6, '2019-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00123', 'C_80', 'Item_5', 'CiD2', 'QZ790', 63, 27106.0, '2019-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00166', 'C_80', 'Item_27', null, 'PK238', 118, 63826.2, '2021-03-22', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00058', 'C_81', 'Item_50', 'CiD6', 'LV898', 244, 79252.0, '2022-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00228', 'C_82', 'Item_33', 'CiD6', 'RX760', 50, 16150.0, '2023-03-01', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00015', 'C_83', 'Item_47', 'CiD3', 'RI775', 109, 34067.95, '2020-07-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00204', 'C_83', 'Item_53', 'CiD4', 'CP880', 196, 46550.0, '2020-12-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00040', 'C_83', 'Item_18', null, null, 87, 19662.0, '2020-10-23', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00048', 'C_84', 'Item_10', null, 'IJ213', 95, 17280.0, '2021-07-02', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00147', 'C_84', 'Item_51', 'CiD3', 'RF170', 228, 112964.0, '2020-07-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00233', 'C_85', 'Item_25', null, 'WV837', 175, 85075.0, '2021-01-23', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00111', 'C_87', 'Item_21', null, 'UN570', 199, 61063.15, '2022-04-10', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00109', 'C_88', 'Item_23', 'CiD6', 'LK921', 156, 122800.0, '2023-03-01', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00128', 'C_88', 'Item_52', 'CiD5', 'DK117', 175, 77725.0, '2021-09-29', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00181', 'C_88', 'Item_53', 'CiD4', 'CP880', 192, 45600.0, '2020-12-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00215', 'C_88', 'Item_43', 'CiD5', 'MJ390', 122, 28208.0, '2021-07-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00035', 'C_89', 'Item_44', 'CiD3', 'OL924', 165, 54245.0, '2020-07-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00062', 'C_9', 'Item_28', null, 'FB617', 59, 21074.8, '2021-12-06', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00153', 'C_9', 'Item_20', null, null, 32, 16320.0, '2019-06-23', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00263', 'C_9', 'Item_55', 'CiD6', 'RJ793', 89, 36092.0, '2022-12-31', 'Household');
INSERT INTO CustomerTransactionData VALUES ('TID00187', 'C_90', 'Item_10', null, 'IJ213', 207, 42368.0, '2022-09-19', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00092', 'C_90', 'Item_13', null, null, 157, 33598.0, '2021-11-10', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00249', 'C_90', 'Item_16', null, null, 212, 48124.0, '2021-11-10', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00017', 'C_91', 'Item_51', 'CiD3', 'RF170', 162, 79106.0, '2020-07-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00049', 'C_91', 'Item_49', 'CiD5', 'FX326', 92, 22107.6, '2021-07-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00264', 'C_91', 'Item_53', null, null, 116, 29000.0, '2021-05-02', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00241', 'C_92', 'Item_29', 'CiD3', 'GE725', 65, 20295.0, '2020-07-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00052', 'C_93', 'Item_61', 'CiD5', 'MS789', 132, 62073.0, '2021-07-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00272', 'C_93', 'Item_11', null, 'SU548', 153, 33037.0, '2021-01-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00267', 'C_94', 'Item_38', null, null, 209, 63745.0, '2020-02-21', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00084', 'C_95', 'Item_7', 'CiD6', 'QG411', 144, 36547.2, '2022-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00069', 'C_97', 'Item_55', null, 'RJ793', 112, 45936.0, '2020-07-23', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00207', 'C_97', 'Item_17', 'CiD6', 'KV471', 83, 17031.6, '2022-12-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00009', 'C_98', 'Item_42', 'CiD4', 'QI961', 150, 76140.0, '2020-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00021', 'C_98', 'Item_6', 'CiD6', 'NH867', 51, 11934.0, '2022-12-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00034', 'C_98', 'Item_56', 'CiD2', 'RJ385', 93, 52921.65, '2019-12-31', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00089', 'C_98', 'Item_10', 'CiD4', 'IJ213', 119, 22656.0, '2020-12-16', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00117', 'C_98', 'Item_13', null, null, 216, 46224.0, '2021-11-07', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00170', 'C_98', 'Item_16', null, null, 194, 44038.0, '2021-11-07', 'Industrial');
INSERT INTO CustomerTransactionData VALUES ('TID00296', 'C_99', 'Item_18', null, null, 195, 44070.0, '2020-02-26', 'Industrial');
