/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3316
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3316
 Source Schema         : bookshopmanagement

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 31/12/2021 16:03:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BookName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT ' ',
  `Price` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ISBN`) USING BTREE,
  UNIQUE INDEX `ISBN`(`ISBN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('123', '123', ' 123', 123);
INSERT INTO `book` VALUES ('654', 'yur', 'xcv', 23);

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `borrowID` int(11) NOT NULL AUTO_INCREMENT,
  `BorrowTime` date NULL DEFAULT NULL,
  `ReaderID` int(11) NULL DEFAULT NULL,
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`borrowID`) USING BTREE,
  INDEX `ReaderID`(`ReaderID`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`ReaderID`) REFERENCES `reader` (`ReaderID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `collectionofbook` (`ISBN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (1, '2021-12-30', 1, '123');
INSERT INTO `borrow` VALUES (3, '2021-12-30', 1, '123');
INSERT INTO `borrow` VALUES (4, '2021-12-30', 1, '123');

-- ----------------------------
-- Table structure for collectionofbook
-- ----------------------------
DROP TABLE IF EXISTS `collectionofbook`;
CREATE TABLE `collectionofbook`  (
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TotalNum` int(11) NULL DEFAULT 0,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  CONSTRAINT `collectionofbook_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collectionofbook
-- ----------------------------
INSERT INTO `collectionofbook` VALUES ('123', 441);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `EmployeeID` int(11) NOT NULL,
  `EmployName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EmploySex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EmployAge` int(11) NULL DEFAULT NULL,
  `EmployTEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Salary` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '士大夫', '男', 16, '123456', 22);

-- ----------------------------
-- Table structure for purchasebook
-- ----------------------------
DROP TABLE IF EXISTS `purchasebook`;
CREATE TABLE `purchasebook`  (
  `PurchaseID` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Price` int(11) NULL DEFAULT NULL,
  `PurchaseNum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`PurchaseID`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  CONSTRAINT `purchasebook_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchasebook
-- ----------------------------
INSERT INTO `purchasebook` VALUES (1, NULL, NULL, NULL);
INSERT INTO `purchasebook` VALUES (2, '123', 111, 11);
INSERT INTO `purchasebook` VALUES (3, '654', 23, 11);
INSERT INTO `purchasebook` VALUES (4, '654', 23, 11);

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader`  (
  `ReaderID` int(11) NOT NULL,
  `ReaderName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '张三',
  `Sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Age` int(11) NULL DEFAULT 18,
  `TEL` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ReaderID`) USING BTREE,
  UNIQUE INDEX `ReaderID`(`ReaderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES (1, 'asd', '男', 18, '12345678910');
INSERT INTO `reader` VALUES (2, 'qwe', '女', 22, '123654');

-- ----------------------------
-- Table structure for returnofbook
-- ----------------------------
DROP TABLE IF EXISTS `returnofbook`;
CREATE TABLE `returnofbook`  (
  `returnID` int(11) NOT NULL AUTO_INCREMENT,
  `ReturnTime` date NULL DEFAULT NULL,
  `ReaderID` int(11) NULL DEFAULT NULL,
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`returnID`) USING BTREE,
  INDEX `ReaderID`(`ReaderID`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  CONSTRAINT `returnofbook_ibfk_1` FOREIGN KEY (`ReaderID`) REFERENCES `reader` (`ReaderID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `returnofbook_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `collectionofbook` (`ISBN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of returnofbook
-- ----------------------------
INSERT INTO `returnofbook` VALUES (1, '2021-12-30', NULL, '123');
INSERT INTO `returnofbook` VALUES (2, '2021-12-30', 1, '123');
INSERT INTO `returnofbook` VALUES (3, '2021-12-30', 1, '123');

-- ----------------------------
-- Table structure for sell
-- ----------------------------
DROP TABLE IF EXISTS `sell`;
CREATE TABLE `sell`  (
  `sell_id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AlreadySold` int(11) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sell_id`) USING BTREE,
  INDEX `ISBN`(`ISBN`) USING BTREE,
  CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sell
-- ----------------------------
INSERT INTO `sell` VALUES (1, NULL, NULL, NULL);
INSERT INTO `sell` VALUES (2, '123', 2, 11);

-- ----------------------------
-- Triggers structure for table borrow
-- ----------------------------
DROP TRIGGER IF EXISTS `borrowBook`;
delimiter ;;
CREATE TRIGGER `borrowBook` BEFORE INSERT ON `borrow` FOR EACH ROW begin
        if (select TotalNum from collectionofbook where CollectionOfBook.ISBN
            = NEW.ISBN
            ) -1 >=0 then
        update collectionofbook set TotalNum = TotalNum-1 where CollectionOfBook.ISBN
        = NEW.ISBN;
        end if;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table returnofbook
-- ----------------------------
DROP TRIGGER IF EXISTS `ReturnBook`;
delimiter ;;
CREATE TRIGGER `ReturnBook` BEFORE INSERT ON `returnofbook` FOR EACH ROW begin
        update collectionofbook set TotalNum = TotalNum+1 where CollectionOfBook.ISBN
        = NEW.ISBN;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table sell
-- ----------------------------
DROP TRIGGER IF EXISTS `decreaseNumberOfBooks`;
delimiter ;;
CREATE TRIGGER `decreaseNumberOfBooks` AFTER INSERT ON `sell` FOR EACH ROW begin
        update CollectionOfBook set TotalNum = TotalNum-NEW.AlreadySold
        where  CollectionOfBook.ISBN = NEW.ISBN;
    end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
