-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: inventory-dev-mysql.cluster-cmrokohw5ij1.us-east-1.rds.amazonaws.com    Database: inventory
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Temporary view structure for view `activeSkusInventory`
--

DROP TABLE IF EXISTS `activeSkusInventory`;
/*!50001 DROP VIEW IF EXISTS `activeSkusInventory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activeSkusInventory` AS SELECT 
 1 AS `skuNumber`,
 1 AS `warehouseID`,
 1 AS `onHandLV`,
 1 AS `onhandInPH`,
 1 AS `minimumOrderQty`,
 1 AS `unProcessedQty`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allWarehouseSkuInventoryLV`
--

DROP TABLE IF EXISTS `allWarehouseSkuInventoryLV`;
/*!50001 DROP VIEW IF EXISTS `allWarehouseSkuInventoryLV`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `allWarehouseSkuInventoryLV` AS SELECT 
 1 AS `skuNumber`,
 1 AS `totalStockLV`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `allWarehouseSkuInventoryPH`
--

DROP TABLE IF EXISTS `allWarehouseSkuInventoryPH`;
/*!50001 DROP VIEW IF EXISTS `allWarehouseSkuInventoryPH`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `allWarehouseSkuInventoryPH` AS SELECT 
 1 AS `skuNumber`,
 1 AS `totalStockPH`,
 1 AS `totalUnprocessed`,
 1 AS `minimumOrderQty`,
 1 AS `totalInbound`,
 1 AS `firstRestockDate`,
 1 AS `lastRestockDate`,
 1 AS `ProductAvailabilityUsage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bd_state_codes`
--

DROP TABLE IF EXISTS `bd_state_codes`;


CREATE TABLE `bd_state_codes` (
  `country_name` varchar(250) NOT NULL,
  `country_code` varchar(50) NOT NULL,
  `country_display_order` int(11) NOT NULL,
  `state_name` varchar(250) NOT NULL,
  `state_alpha_code` varchar(50) NOT NULL,
  `state_numeric_code` varchar(20) NOT NULL,
  `state_display_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_Countries`
--

DROP TABLE IF EXISTS `inv_Countries`;


CREATE TABLE `inv_Countries` (
  `CountryID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(70) NOT NULL,
  `ShortName` varchar(10) DEFAULT NULL,
  `ISO` varchar(3) DEFAULT NULL,
  `Currency` varchar(50) DEFAULT NULL,
  `FedexScale` char(1) DEFAULT NULL,
  `KnoticeCountryID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_LogiviewUpdateJob`
--

DROP TABLE IF EXISTS `inv_LogiviewUpdateJob`;


CREATE TABLE `inv_LogiviewUpdateJob` (
  `rowID` int(11) NOT NULL AUTO_INCREMENT,
  `imsJobID` int(11) DEFAULT NULL,
  `jobStatus` varchar(128) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `internalNote` varchar(512) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_LogiviewUpdateStatus`
--

DROP TABLE IF EXISTS `inv_LogiviewUpdateStatus`;

CREATE TABLE `inv_LogiviewUpdateStatus` (
  `rowID` int(11) NOT NULL AUTO_INCREMENT,
  `imsJobID` int(11) DEFAULT NULL,
  `objectID` bigint(20) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_LogiviewinventoryMaster`
--

DROP TABLE IF EXISTS `inv_LogiviewinventoryMaster`;

CREATE TABLE `inv_LogiviewinventoryMaster` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `pimcoreSupplierID` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `onHandQty` bigint(20) DEFAULT NULL,
  `inboundQty` bigint(20) DEFAULT NULL,
  `pending` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `damaged` bigint(20) DEFAULT NULL,
  `onHold` bigint(20) DEFAULT NULL,
  `shipped` bigint(20) DEFAULT NULL,
  `variance` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `UNIQUE_SKU_WH_IDX` (`skuNumber`,`warehouseID`),
  KEY `warehouse_idx` (`warehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=22601 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_adjustment`
--

DROP TABLE IF EXISTS `inv_adjustment`;

CREATE TABLE `inv_adjustment` (
  `rowID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `skuNumber` bigint(20) DEFAULT NULL,
  `pimCoreWarehouseId` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `createdByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updatedByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `internalNote` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `oldonHandQty` bigint(20) DEFAULT NULL,
  `olddamagedQty` bigint(20) DEFAULT NULL,
  `oldonHoldQty` bigint(20) DEFAULT NULL,
  `adjustonHandQty` bigint(20) DEFAULT NULL,
  `adjustdamagedQty` bigint(20) DEFAULT NULL,
  `adjustonHoldQty` bigint(20) DEFAULT NULL,
  `oldvarianceQty` bigint(20) DEFAULT NULL,
  `adjustvarianceQty` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `inv_allocation`
--

DROP TABLE IF EXISTS `inv_allocation`;

CREATE TABLE `inv_allocation` (
  `rowID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pimCoreWarehouseId` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `orderID` bigint(20) DEFAULT NULL,
  `orderNumber` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `allotedQuantity` bigint(20) DEFAULT NULL,
  `allocationStatus` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `createdByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updatedByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `internalNote` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `containerID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateToArrive` date DEFAULT NULL,
  `inboundEntryID` bigint(30) DEFAULT NULL,
  `orderAllocationStatus` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB AUTO_INCREMENT=888 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `inv_baseForecast`
--

DROP TABLE IF EXISTS `inv_baseForecast`;

CREATE TABLE `inv_baseForecast` (
  `rowID` int(11) NOT NULL AUTO_INCREMENT,
  `createdTimestamp` datetime NOT NULL,
  `skuNumber` int(11) NOT NULL,
  `TimePeriod` int(11) NOT NULL,
  `DateKey` date NOT NULL,
  `pimcoreSupplierID` int(11) NOT NULL,
  `pimcoreWarehouseID` int(11) NOT NULL,
  `forecastQty` decimal(20,4) DEFAULT NULL,
  `forecastRev` decimal(20,4) DEFAULT NULL,
  `inStockForecastQty` decimal(20,4) DEFAULT NULL,
  `inStockForecastRev` decimal(20,4) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `comindex` (`pimcoreSupplierID`,`skuNumber`,`pimcoreWarehouseID`,`DateKey`)
) ENGINE=InnoDB AUTO_INCREMENT=10974923 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_bin`
--

DROP TABLE IF EXISTS `inv_bin`;

CREATE TABLE `inv_bin` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(100) DEFAULT NULL,
  `msgKey` bigint(20) DEFAULT NULL,
  `msgSequenceNumber` bigint(20) DEFAULT NULL,
  `rowCreated` datetime DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `internalNote` text,
  PRIMARY KEY (`rowID`),
  KEY `msgKey` (`msgKey`)
) ENGINE=InnoDB AUTO_INCREMENT=15053 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_brand`
--

DROP TABLE IF EXISTS `inv_brand`;

CREATE TABLE `inv_brand` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `brandID` bigint(20) NOT NULL,
  `brandName` varchar(256) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `msgKey` bigint(20) NOT NULL,
  `msgSequenceNumber` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`,`brandID`),
  UNIQUE KEY `rowID` (`rowID`),
  UNIQUE KEY `brandID_UNIQUE` (`brandID`),
  UNIQUE KEY `msgKey_UNIQUE` (`msgKey`)
) ENGINE=InnoDB AUTO_INCREMENT=1734 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_carriers`
--

DROP TABLE IF EXISTS `inv_carriers`;

CREATE TABLE `inv_carriers` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `carrierID` bigint(30) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  `instructions` longtext,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `carrierID_idx` (`carrierID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_category`
--

DROP TABLE IF EXISTS `inv_category`;

CREATE TABLE `inv_category` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryID` bigint(20) NOT NULL,
  `categoryName` varchar(256) DEFAULT NULL,
  `categoryLevel` tinyint(1) DEFAULT NULL,
  `parentID` bigint(20) DEFAULT NULL,
  `categoryCode` varchar(128) DEFAULT NULL,
  `splPackagingRequired` text,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `msgKey` bigint(20) NOT NULL,
  `msgSequenceNumber` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`,`categoryID`),
  UNIQUE KEY `rowID` (`rowID`),
  UNIQUE KEY `categoryID_UNIQUE` (`categoryID`),
  UNIQUE KEY `msgKey_UNIQUE` (`msgKey`),
  KEY `idx_categoryLevel` (`categoryLevel`),
  KEY `idx_parentID` (`parentID`)
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_change_allocation`
--

DROP TABLE IF EXISTS `inv_change_allocation`;

CREATE TABLE `inv_change_allocation` (
  `rowID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pimCoreWarehouseId` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `orderID` bigint(20) DEFAULT NULL,
  `orderNumber` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `allotedQuantity` bigint(20) DEFAULT NULL,
  `allocationStatus` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `createdByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updatedByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `internalNote` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `containerID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `dateToArrive` date DEFAULT NULL,
  `inboundEntryID` bigint(30) DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `inv_contact`
--

DROP TABLE IF EXISTS `inv_contact`;

CREATE TABLE `inv_contact` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `contactID` bigint(20) NOT NULL,
  `contactType` varchar(50) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jobtitle` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `companyName` varchar(255) DEFAULT NULL,
  `employeeNumber` varchar(255) DEFAULT NULL,
  `contactPhoto` varchar(255) DEFAULT NULL,
  `internalNote` text,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `contactID_UNIQUE` (`contactID`)
) ENGINE=InnoDB AUTO_INCREMENT=3995 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_dealSkuMap`
--

DROP TABLE IF EXISTS `inv_dealSkuMap`;

CREATE TABLE `inv_dealSkuMap` (
  `rowID` int(11) NOT NULL AUTO_INCREMENT,
  `dealID` bigint(30) DEFAULT NULL,
  `skuNumber` bigint(30) DEFAULT NULL,
  `skuID` bigint(30) DEFAULT NULL,
  `promotionAmount` double DEFAULT NULL,
  `promotionAmountType` varchar(255) DEFAULT NULL,
  `indexOrder` tinyint(1) DEFAULT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `idx_deal` (`dealID`),
  KEY `idx_skuNumber` (`skuNumber`),
  KEY `idx_deal_sku` (`dealID`,`skuNumber`),
  KEY `idx_skuID` (`skuID`)
) ENGINE=InnoDB AUTO_INCREMENT=43086 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_deals`
--

DROP TABLE IF EXISTS `inv_deals`;

CREATE TABLE `inv_deals` (
  `rowID` bigint(30) NOT NULL AUTO_INCREMENT,
  `dealID` bigint(30) DEFAULT NULL,
  `msgKey` bigint(20) NOT NULL,
  `msgSequenceNumber` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `bannerOnProducts` varchar(255) DEFAULT NULL,
  `promotionType` varchar(255) DEFAULT NULL,
  `promotionSubType` varchar(45) DEFAULT NULL,
  `durationType` varchar(255) DEFAULT NULL,
  `skuSelection` varchar(255) DEFAULT NULL,
  `managedBy` varchar(255) DEFAULT NULL,
  `lifecycle` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `promotionAmountType` varchar(255) DEFAULT NULL,
  `promotionAmount` double DEFAULT NULL,
  `maxDiscount` double DEFAULT NULL,
  `supplier` bigint(30) DEFAULT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `IDX_DEALID` (`dealID`),
  KEY `IDX_MSGKEY` (`msgKey`),
  KEY `IDX_MSGSEQNUM` (`msgSequenceNumber`),
  KEY `IDX_STARTDATE` (`startDate`),
  KEY `IDX_ENDDATE` (`endDate`),
  KEY `IDX_LIFECYCLE` (`lifecycle`),
  KEY `IDX_PROMOTIONTYPE` (`promotionType`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_descriptiveTypes`
--

DROP TABLE IF EXISTS `inv_descriptiveTypes`;

CREATE TABLE `inv_descriptiveTypes` (
  `descriptiveTypeID` int(11) NOT NULL,
  `descriptiveType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`descriptiveTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_draftMessageChangeLog`
--

DROP TABLE IF EXISTS `inv_draftMessageChangeLog`;

CREATE TABLE `inv_draftMessageChangeLog` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `objectType` varchar(50) DEFAULT NULL,
  `jobID` bigint(20) DEFAULT NULL,
  `msgKey` bigint(20) DEFAULT NULL,
  `fieldName` longtext,
  `rowCreated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `objectType` (`objectType`),
  KEY `msgKey` (`msgKey`),
  KEY `rowCreatedEpoch` (`rowCreatedEpoch`),
  KEY `rowUpdatedEpoch` (`rowUpdatedEpoch`),
  KEY `jobIDIndex` (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=14155 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_draftMessageChangeLogDump`
--

DROP TABLE IF EXISTS `inv_draftMessageChangeLogDump`;

CREATE TABLE `inv_draftMessageChangeLogDump` (
  `rowID` bigint(20) NOT NULL DEFAULT '0',
  `objectType` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `jobID` bigint(20) DEFAULT NULL,
  `msgKey` bigint(20) DEFAULT NULL,
  `fieldName` longtext CHARACTER SET utf8,
  `rowCreated` datetime DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_filterAttrJoinCondition`
--

DROP TABLE IF EXISTS `inv_filterAttrJoinCondition`;

CREATE TABLE `inv_filterAttrJoinCondition` (
  `joinID` int(11) NOT NULL AUTO_INCREMENT,
  `reportCode` varchar(255) NOT NULL,
  `attrCode` varchar(255) DEFAULT NULL,
  `associateTable` varchar(255) NOT NULL,
  `column1` varchar(255) NOT NULL,
  `column2` varchar(255) NOT NULL,
  `masterTable` varchar(255) NOT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(30) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(30) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`joinID`),
  KEY `idx_reportCode` (`reportCode`),
  KEY `idx_attrCode` (`attrCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_filterAttributes`
--

DROP TABLE IF EXISTS `inv_filterAttributes`;

CREATE TABLE `inv_filterAttributes` (
  `attrID` int(11) NOT NULL AUTO_INCREMENT,
  `attrCode` varchar(45) NOT NULL,
  `attrName` varchar(255) NOT NULL,
  `attrDataType` varchar(50) NOT NULL,
  `displayColumnName` varchar(255) NOT NULL,
  `keyColumnName` varchar(255) NOT NULL,
  `keyColumnDataType` varchar(255) NOT NULL,
  `tableName` varchar(255) NOT NULL,
  `dbName` varchar(255) NOT NULL,
  `isFilter` bit(1) DEFAULT NULL,
  `filterCondition` varchar(500) DEFAULT NULL,
  `filterType` varchar(50) DEFAULT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(30) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(30) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  `isNested` tinyint(1) DEFAULT NULL,
  `nestedColumn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attrID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_filterAttributesReportCodeMap`
--

DROP TABLE IF EXISTS `inv_filterAttributesReportCodeMap`;

CREATE TABLE `inv_filterAttributesReportCodeMap` (
  `rowID` bigint(30) NOT NULL AUTO_INCREMENT,
  `attrCode` varchar(100) DEFAULT NULL,
  `reportCode` varchar(100) DEFAULT NULL,
  `filterCondition` varchar(45) DEFAULT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(30) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(30) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `reportCode` (`reportCode`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_inBoundInventory`
--

DROP TABLE IF EXISTS `inv_inBoundInventory`;

CREATE TABLE `inv_inBoundInventory` (
  `rowID` int(11) NOT NULL AUTO_INCREMENT,
  `pimcoreSupplierID` int(11) DEFAULT NULL,
  `skuNumber` int(11) NOT NULL,
  `pimcoreWarehouseID` int(11) NOT NULL,
  `inboundEntryID` bigint(30) DEFAULT NULL,
  `inboundquantity` bigint(30) DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `dateKey` date DEFAULT NULL,
  `instructions` text,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  `cvd` varchar(45) DEFAULT NULL,
  `adcase` varchar(45) DEFAULT NULL,
  `carbID` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `allocatedQty` bigint(20) DEFAULT NULL,
  `sellUnitUOM` varchar(45) DEFAULT NULL,
  `sellUnitWeight` double DEFAULT NULL,
  `sellUnitPerShipUnit` double DEFAULT NULL,
  `createdByUser` varchar(255) DEFAULT NULL,
  `updatedByUser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `comindex` (`skuNumber`,`pimcoreWarehouseID`,`inboundEntryID`,`dateKey`),
  KEY `idx_inbound` (`inboundEntryID`),
  KEY `idx_skuInb` (`inboundEntryID`,`skuNumber`),
  KEY `idx_skuNumber` (`skuNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=7826 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_inBoundInventoryAudit`
--

DROP TABLE IF EXISTS `inv_inBoundInventoryAudit`;

CREATE TABLE `inv_inBoundInventoryAudit` (
  `rowID` int(11) NOT NULL AUTO_INCREMENT,
  `pimcoreSupplierID` int(11) NOT NULL,
  `skuNumber` int(11) NOT NULL,
  `pimcoreWarehouseID` int(11) NOT NULL,
  `inboundEntryID` int(4) NOT NULL,
  `inboundquantity` int(4) DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `dateKey` date DEFAULT NULL,
  `instructions` text,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `comindex` (`pimcoreSupplierID`,`skuNumber`,`pimcoreWarehouseID`,`dateKey`,`inboundEntryID`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;



--
-- Table structure for table `inv_inboundEntry`
--

DROP TABLE IF EXISTS `inv_inboundEntry`;

CREATE TABLE `inv_inboundEntry` (
  `inboundEntryID` bigint(30) NOT NULL AUTO_INCREMENT,
  `pimcoreSupplierID` int(11) NOT NULL,
  `pimcoreWarehouseID` int(11) NOT NULL,
  `carrierID` bigint(30) DEFAULT NULL,
  `containerID` varchar(255) DEFAULT NULL,
  `dateKey` date DEFAULT NULL,
  `logviewInboundId` bigint(30) DEFAULT NULL,
  `logiviewReceiptID` bigint(30) DEFAULT NULL,
  `dateToShip` date DEFAULT NULL,
  `dateToArrive` date DEFAULT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  `containerID2` varchar(255) DEFAULT NULL,
  `vendorpoID` varchar(70) DEFAULT NULL,
  `proID` varchar(70) DEFAULT NULL,
  `sealID` varchar(70) DEFAULT NULL,
  `masterblID` varchar(70) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `createdByUser` varchar(255) DEFAULT NULL,
  `updatedByUser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`inboundEntryID`),
  UNIQUE KEY `inboundEntryID_UNIQUE` (`inboundEntryID`),
  KEY `idx_warehouseID` (`pimcoreWarehouseID`),
  KEY `idx_carrierID` (`carrierID`),
  KEY `idx_custOrd` (`containerID`),
  KEY `idx_dateKey` (`dateKey`),
  KEY `idx_lvinboundid` (`logviewInboundId`),
  KEY `idx_lvreceiptid` (`logiviewReceiptID`),
  KEY `idx_datetoarrive` (`dateToArrive`),
  KEY `idx_composite` (`containerID`,`pimcoreWarehouseID`,`logviewInboundId`,`dateToArrive`)
) ENGINE=InnoDB AUTO_INCREMENT=9058 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_inboundreceive`
--

DROP TABLE IF EXISTS `inv_inboundreceive`;

CREATE TABLE `inv_inboundreceive` (
  `rowID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pimcoreSupplierID` int(11) DEFAULT NULL,
  `skuNumber` int(11) DEFAULT NULL,
  `pimcoreWarehouseID` int(11) DEFAULT NULL,
  `inboundEntryID` bigint(30) DEFAULT NULL,
  `receivedqty` bigint(20) DEFAULT NULL,
  `toavailable` bigint(20) DEFAULT NULL,
  `todamaged` bigint(20) DEFAULT NULL,
  `toonhold` bigint(20) DEFAULT NULL,
  `tovariance` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `createdByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updatedByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `internalNote` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `inv_inventoryHistory`
--

DROP TABLE IF EXISTS `inv_inventoryHistory`;

CREATE TABLE `inv_inventoryHistory` (
  `rowID` bigint(20) NOT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `QTY` bigint(20) DEFAULT NULL,
  `dateReceived` timestamp NULL DEFAULT NULL,
  `dateShipped` timestamp NULL DEFAULT NULL,
  `batchnumber` bigint(20) DEFAULT NULL,
  `lotnumber` bigint(20) DEFAULT NULL,
  `returnedQTY` bigint(20) DEFAULT NULL,
  `damagedQTY` bigint(20) DEFAULT NULL,
  `onHoldQTY` bigint(20) DEFAULT NULL,
  `uniqueID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_inventoryJournal`
--

DROP TABLE IF EXISTS `inv_inventoryJournal`;

CREATE TABLE `inv_inventoryJournal` (
  `rowID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `orderType` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `orderDate` datetime(6) DEFAULT NULL,
  `orderNumber` bigint(20) DEFAULT NULL,
  `orderQuantity` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `sourceWarehouseId` bigint(20) DEFAULT NULL,
  `targetWarehouseId` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `createdByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updatedByUser` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `internalNote` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `eventType` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `onHandQty` bigint(20) DEFAULT NULL,
  `inboundQty` bigint(20) DEFAULT NULL,
  `pending` bigint(20) DEFAULT NULL,
  `damaged` bigint(20) DEFAULT NULL,
  `onHold` bigint(20) DEFAULT NULL,
  `shipped` bigint(20) DEFAULT NULL,
  `variance` bigint(20) DEFAULT NULL,
  `invAdjustmentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB AUTO_INCREMENT=1305 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `inv_inventoryMaster`
--

DROP TABLE IF EXISTS `inv_inventoryMaster`;

CREATE TABLE `inv_inventoryMaster` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `pimcoreSupplierID` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `onHandQty` bigint(20) DEFAULT NULL,
  `inboundQty` bigint(20) DEFAULT NULL,
  `pending` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `damaged` bigint(20) DEFAULT NULL,
  `onHold` bigint(20) DEFAULT NULL,
  `shipped` bigint(20) DEFAULT NULL,
  `variance` bigint(20) DEFAULT NULL,
  `createdByUser` varchar(255) DEFAULT NULL,
  `updatedByUser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `UNIQUE_SKU_WH_IDX` (`skuNumber`,`warehouseID`),
  KEY `warehouse_idx` (`warehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=61886 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_inventoryMasterDump`
--

DROP TABLE IF EXISTS `inv_inventoryMasterDump`;

CREATE TABLE `inv_inventoryMasterDump` (
  `rowID` bigint(20) NOT NULL DEFAULT '0',
  `pimcoreSupplierID` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `onHandQty` bigint(20) DEFAULT NULL,
  `inboundQty` bigint(20) DEFAULT NULL,
  `pending` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_inventoryUpdateJournal`
--

DROP TABLE IF EXISTS `inv_inventoryUpdateJournal`;

CREATE TABLE `inv_inventoryUpdateJournal` (
  `rowID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `orderType` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `orderDate` datetime(6) DEFAULT NULL,
  `orderNumber` bigint(20) DEFAULT NULL,
  `orderQuantity` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `pimCoreWarehouseId` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `createdBy` bigint(20) DEFAULT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `internalNote` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`rowID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table structure for table `inv_jobStatus`
--

DROP TABLE IF EXISTS `inv_jobStatus`;

CREATE TABLE `inv_jobStatus` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `startTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `jobType` varchar(45) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `jobContext` longtext,
  `jobOutput` varchar(255) DEFAULT NULL,
  `errorText` longtext,
  `rowCreated` datetime DEFAULT NULL,
  `rowUpdated` datetime DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `Status` (`status`),
  KEY `jobType` (`jobType`),
  KEY `startTimeIndex` (`startTime`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_logiviewWarehouseMap`
--

DROP TABLE IF EXISTS `inv_logiviewWarehouseMap`;

CREATE TABLE `inv_logiviewWarehouseMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouseID` bigint(30) DEFAULT NULL,
  `logiviewWarehouseID` varchar(255) DEFAULT NULL,
  `isPrimaryWarehouse` bit(1) DEFAULT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `idx_whID` (`warehouseID`),
  KEY `idx_lvwhID` (`logiviewWarehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_messageChangeLog`
--

DROP TABLE IF EXISTS `inv_messageChangeLog`;

CREATE TABLE `inv_messageChangeLog` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `objectType` varchar(50) DEFAULT NULL,
  `jobID` bigint(20) DEFAULT NULL,
  `msgKey` bigint(20) DEFAULT NULL,
  `fieldName` longtext,
  `rowCreated` datetime DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `msgKeyIndex` (`msgKey`),
  KEY `rowCreatedIndex` (`rowCreatedEpoch`),
  KEY `rowUpdatedIndex` (`rowUpdatedEpoch`),
  KEY `jobIDIndex` (`jobID`)
) ENGINE=InnoDB AUTO_INCREMENT=66759 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_messageHistory`
--

DROP TABLE IF EXISTS `inv_messageHistory`;

CREATE TABLE `inv_messageHistory` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(100) DEFAULT NULL,
  `msgKey` bigint(20) NOT NULL,
  `msgSequenceNumber` bigint(20) DEFAULT NULL,
  `objectType` varchar(100) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `message` longtext,
  `rowCreated` datetime DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `internalNote` text,
  PRIMARY KEY (`rowID`),
  KEY `msgKeyIndex` (`msgKey`),
  KEY `msgSequenceIndex` (`msgSequenceNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=1263268 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_onHandInventory`
--

DROP TABLE IF EXISTS `inv_onHandInventory`;

CREATE TABLE `inv_onHandInventory` (
  `rowID` int(11) NOT NULL AUTO_INCREMENT,
  `pimcoreSupplierID` int(11) NOT NULL,
  `skuNumber` int(11) NOT NULL,
  `pimcoreWarehouseID` int(11) NOT NULL,
  `onHandquantity` int(4) DEFAULT NULL,
  `visibilityCode` tinyint(1) DEFAULT NULL,
  `productionLeadTime` int(11) DEFAULT NULL,
  `warehouseLeadTime` int(11) DEFAULT NULL,
  `shippingLeadTime` int(11) DEFAULT NULL,
  `minimumOrderQty` decimal(10,6) DEFAULT NULL,
  `MinReplenishmentQty` decimal(10,5) DEFAULT NULL,
  `cost` decimal(10,3) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `comindex` (`pimcoreSupplierID`,`skuNumber`,`pimcoreWarehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=218906 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_onHandInventory_ims`
--

DROP TABLE IF EXISTS `inv_onHandInventory_ims`;

CREATE TABLE `inv_onHandInventory_ims` (
  `rowID` int(11) NOT NULL AUTO_INCREMENT,
  `pimcoreSupplierID` int(11) NOT NULL,
  `skuNumber` int(11) NOT NULL,
  `pimcoreWarehouseID` int(11) NOT NULL,
  `onHandquantity` int(4) DEFAULT NULL,
  `visibilityCode` tinyint(1) DEFAULT NULL,
  `productionLeadTime` int(11) DEFAULT NULL,
  `warehouseLeadTime` int(11) DEFAULT NULL,
  `shippingLeadTime` int(11) DEFAULT NULL,
  `minimumOrderQty` decimal(10,6) DEFAULT NULL,
  `MinReplenishmentQty` decimal(10,5) DEFAULT NULL,
  `cost` decimal(10,3) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  `unProcessedQty` bigint(20) DEFAULT NULL,
  `productAvailabilityUsage` tinyint(1) DEFAULT NULL,
  `inboundInventory` int(11) DEFAULT NULL,
  `nextRestockDate` datetime DEFAULT NULL,
  `SourceNodeId` int(11) NOT NULL,
  PRIMARY KEY (`rowID`),
  KEY `comindex` (`pimcoreSupplierID`,`skuNumber`,`pimcoreWarehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=12240 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


--
-- Table structure for table `inv_plannedCommitAudit`
--

DROP TABLE IF EXISTS `inv_plannedCommitAudit`;

CREATE TABLE `inv_plannedCommitAudit` (
  `transactionID` bigint(50) NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `commitedInbound` bigint(20) DEFAULT NULL,
  `commitedInboundweek` date DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NULL DEFAULT NULL,
  `commitWeek` date DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  UNIQUE KEY `unique_index` (`supplierID`,`warehouseID`,`skuNumber`,`commitedInboundweek`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_plannedCommitAudit_dump`
--

DROP TABLE IF EXISTS `inv_plannedCommitAudit_dump`;

CREATE TABLE `inv_plannedCommitAudit_dump` (
  `transactionID` bigint(50) NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `commitedInbound` bigint(20) DEFAULT NULL,
  `commitedInboundweek` date DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NULL DEFAULT NULL,
  `commitWeek` date DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  UNIQUE KEY `unique_index` (`supplierID`,`warehouseID`,`skuNumber`,`commitedInboundweek`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_planningBase`
--

DROP TABLE IF EXISTS `inv_planningBase`;

CREATE TABLE `inv_planningBase` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryID` bigint(20) DEFAULT NULL,
  `supplierID` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `descriptiveTypeID` int(11) DEFAULT NULL,
  `week1` decimal(10,2) DEFAULT NULL,
  `week2` decimal(10,2) DEFAULT NULL,
  `week3` decimal(10,2) DEFAULT NULL,
  `week4` decimal(10,2) DEFAULT NULL,
  `week5` decimal(10,2) DEFAULT NULL,
  `week6` decimal(10,2) DEFAULT NULL,
  `week7` decimal(10,2) DEFAULT NULL,
  `week8` decimal(10,2) DEFAULT NULL,
  `week9` decimal(10,2) DEFAULT NULL,
  `week10` decimal(10,2) DEFAULT NULL,
  `week11` decimal(10,2) DEFAULT NULL,
  `week12` decimal(10,2) DEFAULT NULL,
  `week13` decimal(10,2) DEFAULT NULL,
  `week14` decimal(10,2) DEFAULT NULL,
  `week15` decimal(10,2) DEFAULT NULL,
  `week16` decimal(10,2) DEFAULT NULL,
  `week17` decimal(10,2) DEFAULT NULL,
  `week18` decimal(10,2) DEFAULT NULL,
  `week19` decimal(10,2) DEFAULT NULL,
  `week20` decimal(10,2) DEFAULT NULL,
  `week21` decimal(10,2) DEFAULT NULL,
  `week22` decimal(10,2) DEFAULT NULL,
  `week23` decimal(10,2) DEFAULT NULL,
  `week24` decimal(10,2) DEFAULT NULL,
  `week25` decimal(10,2) DEFAULT NULL,
  `week26` decimal(10,2) DEFAULT NULL,
  `week27` decimal(10,2) DEFAULT NULL,
  `week28` decimal(10,2) DEFAULT NULL,
  `week29` decimal(10,2) DEFAULT NULL,
  `week30` decimal(10,2) DEFAULT NULL,
  `week31` decimal(10,2) DEFAULT NULL,
  `week32` decimal(10,2) DEFAULT NULL,
  `week33` decimal(10,2) DEFAULT NULL,
  `week34` decimal(10,2) DEFAULT NULL,
  `week35` decimal(10,2) DEFAULT NULL,
  `week36` decimal(10,2) DEFAULT NULL,
  `week37` decimal(10,2) DEFAULT NULL,
  `week38` decimal(10,2) DEFAULT NULL,
  `week39` decimal(10,2) DEFAULT NULL,
  `week40` decimal(10,2) DEFAULT NULL,
  `week41` decimal(10,2) DEFAULT NULL,
  `week42` decimal(10,2) DEFAULT NULL,
  `week43` decimal(10,2) DEFAULT NULL,
  `week44` decimal(10,2) DEFAULT NULL,
  `week45` decimal(10,2) DEFAULT NULL,
  `week46` decimal(10,2) DEFAULT NULL,
  `week47` decimal(10,2) DEFAULT NULL,
  `week48` decimal(10,2) DEFAULT NULL,
  `week49` decimal(10,2) DEFAULT NULL,
  `week50` decimal(10,2) DEFAULT NULL,
  `week51` decimal(10,2) DEFAULT NULL,
  `week52` decimal(10,2) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `attribute1` varchar(200) DEFAULT NULL,
  `attribute2` varchar(200) DEFAULT NULL,
  `attribute3` varchar(200) DEFAULT NULL,
  `attribute4` varchar(200) DEFAULT NULL,
  `attribute5` double DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `unique_index` (`supplierID`,`warehouseID`,`skuNumber`,`descriptiveTypeID`),
  KEY `fk_inv_planning_base_key2` (`supplierID`),
  KEY `fk_inv_planning_base_key3` (`descriptiveTypeID`),
  KEY `inv_skuNumber` (`skuNumber`),
  CONSTRAINT `fk_inv_planning_base_key3` FOREIGN KEY (`descriptiveTypeID`) REFERENCES `inv_descriptiveTypes` (`descriptiveTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53753722 DEFAULT CHARSET=utf8;




--
-- Table structure for table `inv_planningConfig`
--

DROP TABLE IF EXISTS `inv_planningConfig`;

CREATE TABLE `inv_planningConfig` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) DEFAULT NULL,
  `categoryID` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `minWOC` bigint(20) DEFAULT NULL,
  `maxWOC` bigint(20) DEFAULT NULL,
  `planningDuration` int(11) DEFAULT NULL,
  `targetWoc` bigint(20) DEFAULT NULL,
  `minReplenishmentQty` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `config_index` (`supplierID`,`categoryID`,`warehouseID`,`skuNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_planningHeader`
--

DROP TABLE IF EXISTS `inv_planningHeader`;

CREATE TABLE `inv_planningHeader` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryID` bigint(20) DEFAULT NULL,
  `supplierID` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `missedOpportunity` decimal(20,3) DEFAULT NULL,
  `stockFlag` bigint(20) DEFAULT NULL,
  `dateKey` date DEFAULT NULL,
  `leadTime` int(11) DEFAULT NULL,
  `visibilitycode` tinyint(1) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cost` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `unique_index` (`supplierID`,`skuNumber`,`warehouseID`),
  KEY `visibility_index` (`visibilitycode`),
  KEY `missedopportunity_index` (`supplierID`,`missedOpportunity`),
  KEY `datekey` (`dateKey`)
) ENGINE=InnoDB AUTO_INCREMENT=6719195 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_recomendedReplenishmentAudit`
--

DROP TABLE IF EXISTS `inv_recomendedReplenishmentAudit`;

CREATE TABLE `inv_recomendedReplenishmentAudit` (
  `transactionID` bigint(50) NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `computedRR` bigint(20) DEFAULT NULL,
  `computedRRweek` date DEFAULT NULL,
  `minWOC` int(11) DEFAULT '4',
  `maxWOC` int(11) DEFAULT '7',
  `targetWOC` int(11) DEFAULT '7',
  `runWeek` date DEFAULT NULL,
  `analytsRR` bigint(20) DEFAULT NULL,
  `analytsweek` date DEFAULT NULL,
  `analytsUpdatedTime` timestamp NULL DEFAULT NULL,
  `supplierRR` bigint(20) DEFAULT NULL,
  `supplierWeek` date DEFAULT NULL,
  `supplierResponseWeek` date DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  UNIQUE KEY `unique` (`supplierID`,`skuNumber`,`warehouseID`,`computedRRweek`,`runWeek`)
) ENGINE=InnoDB AUTO_INCREMENT=1020686 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_reportCode`
--

DROP TABLE IF EXISTS `inv_reportCode`;

CREATE TABLE `inv_reportCode` (
  `rowID` bigint(30) NOT NULL AUTO_INCREMENT,
  `reportCode` varchar(100) DEFAULT NULL,
  `reportTable` varchar(100) DEFAULT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(30) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(30) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `reportCode_UNIQUE` (`reportCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_rrWOCAudit`
--

DROP TABLE IF EXISTS `inv_rrWOCAudit`;

CREATE TABLE `inv_rrWOCAudit` (
  `transactionID` bigint(50) NOT NULL AUTO_INCREMENT,
  `supplierID` int(11) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `computedRR` bigint(20) DEFAULT NULL,
  `computedRRweek` date DEFAULT NULL,
  `minWOC` int(11) DEFAULT '4',
  `maxWOC` int(11) DEFAULT '7',
  `targetWOC` int(11) DEFAULT '7',
  `runWeek` date DEFAULT NULL,
  `analytsRR` bigint(20) DEFAULT NULL,
  `analytsweek` date DEFAULT NULL,
  `analytsUpdatedTime` timestamp NULL DEFAULT NULL,
  `supplierRR` bigint(20) DEFAULT NULL,
  `supplierWeek` date DEFAULT NULL,
  `supplierResponseWeek` date DEFAULT NULL,
  `comment` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `createdTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  UNIQUE KEY `transactionID_UNIQUE` (`transactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=1020657 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_skuChannelMap`
--

DROP TABLE IF EXISTS `inv_skuChannelMap`;

CREATE TABLE `inv_skuChannelMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `skuNumber` bigint(20) DEFAULT NULL,
  `channelID` bigint(20) DEFAULT NULL,
  `rowCreated` datetime DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime DEFAULT NULL,
  `internalNote` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `idx_skuNumber` (`skuNumber`),
  KEY `idx_channelID` (`channelID`)
) ENGINE=InnoDB AUTO_INCREMENT=906015 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_skuData`
--

DROP TABLE IF EXISTS `inv_skuData`;

CREATE TABLE `inv_skuData` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `productID` bigint(20) NOT NULL,
  `categoryID` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `skuName` varchar(256) DEFAULT NULL,
  `partNumber` varchar(256) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `brandID` bigint(20) DEFAULT NULL,
  `supplierID` bigint(20) DEFAULT NULL,
  `sellUnitUOM` varchar(45) DEFAULT NULL,
  `sellUnitLength` double DEFAULT NULL,
  `sellUnitWidth` double DEFAULT NULL,
  `sellUnitHeight` double DEFAULT NULL,
  `sellUnitDistanceUOM` varchar(45) DEFAULT NULL,
  `sellUnitWeight` double DEFAULT NULL,
  `sellUnitPerShipUnit` double DEFAULT NULL,
  `sellUnitWeightUOM` varchar(45) DEFAULT NULL,
  `priceUnitUOM` varchar(255) DEFAULT NULL,
  `priceUnitPerSellUnit` double DEFAULT NULL,
  `shipUnitUOM` varchar(45) DEFAULT NULL,
  `shipUnitLength` double DEFAULT NULL,
  `shipUnitWidth` double DEFAULT NULL,
  `shipUnitHeight` double DEFAULT NULL,
  `shipUnitDistanceUOM` varchar(45) DEFAULT NULL,
  `shipUnitWeight` double DEFAULT NULL,
  `shipUnitWeightUOM` varchar(45) DEFAULT NULL,
  `storageUnitUOM` varchar(45) DEFAULT NULL,
  `storageUnitLength` double DEFAULT NULL,
  `storageUnitWidth` double DEFAULT NULL,
  `storageUnitHeight` double DEFAULT NULL,
  `storageUnitDistanceUOM` varchar(45) DEFAULT NULL,
  `storageUnitWeight` double DEFAULT NULL,
  `shipUnitPerStorageUnit` double DEFAULT NULL,
  `storageUnitWeightUOM` varchar(45) DEFAULT NULL,
  `sellUnitPerStorageUnit` varchar(45) DEFAULT NULL,
  `storageUnitMaxStack` double DEFAULT NULL,
  `storageUnitMaxStackWeight` double DEFAULT NULL,
  `nmfcCode` varchar(45) DEFAULT NULL,
  `ltlCode` varchar(45) DEFAULT NULL,
  `productionLeadTime` int(11) DEFAULT NULL,
  `excludeFromCourier` tinyint(1) DEFAULT NULL,
  `splHandlingInstructions` text,
  `splPackageInstructions` text,
  `isMadeToOrder` tinyint(4) DEFAULT NULL,
  `skuConsideredEpoch` bigint(20) DEFAULT NULL,
  `skuFirstConsideredEpoch` bigint(20) DEFAULT NULL,
  `createdBy` varchar(100) DEFAULT NULL,
  `updatedBy` varchar(100) DEFAULT NULL,
  `createdTime` bigint(20) DEFAULT NULL,
  `updatedTime` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `msgKey` bigint(20) NOT NULL,
  `msgSequenceNumber` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  `productType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rowID`,`productID`),
  UNIQUE KEY `row_ID_UNIQUE` (`rowID`),
  UNIQUE KEY `productID_UNIQUE` (`productID`),
  UNIQUE KEY `msgKey_UNIQUE` (`msgKey`),
  KEY `fk_inv_sku_data_key1` (`categoryID`),
  KEY `fk_inv_sku_data_key2` (`brandID`),
  KEY `fk_inv_sku_data_key3` (`supplierID`),
  KEY `idx_sku_number` (`skuNumber`),
  KEY `supplierid_skunumber_index` (`supplierID`,`skuNumber`),
  KEY `rowCreatedIndex` (`rowCreatedEpoch`),
  KEY `rowUpdatedIndex` (`rowUpdatedEpoch`),
  KEY `idx_skuFirstConsideredEpoch` (`skuFirstConsideredEpoch`),
  KEY `madeToOrder` (`isMadeToOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=219667 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_skuData_history`
--

DROP TABLE IF EXISTS `inv_skuData_history`;

CREATE TABLE `inv_skuData_history` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `productID` bigint(20) NOT NULL,
  `categoryID` bigint(20) DEFAULT NULL,
  `skuNumber` bigint(20) DEFAULT NULL,
  `name` varchar(256) DEFAULT NULL,
  `skuName` varchar(256) DEFAULT NULL,
  `partNumber` varchar(256) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `brandID` bigint(20) DEFAULT NULL,
  `supplierID` bigint(20) DEFAULT NULL,
  `sellUnitUOM` varchar(45) DEFAULT NULL,
  `sellUnitLength` double DEFAULT NULL,
  `sellUnitWidth` double DEFAULT NULL,
  `sellUnitHeight` double DEFAULT NULL,
  `sellUnitDistanceUOM` varchar(45) DEFAULT NULL,
  `sellUnitWeight` double DEFAULT NULL,
  `sellUnitPerShipUnit` double DEFAULT NULL,
  `sellUnitWeightUOM` varchar(45) DEFAULT NULL,
  `priceUnitUOM` varchar(255) DEFAULT NULL,
  `priceUnitPerSellUnit` double DEFAULT NULL,
  `shipUnitUOM` varchar(45) DEFAULT NULL,
  `shipUnitLength` double DEFAULT NULL,
  `shipUnitWidth` double DEFAULT NULL,
  `shipUnitHeight` double DEFAULT NULL,
  `shipUnitDistanceUOM` varchar(45) DEFAULT NULL,
  `shipUnitWeight` double DEFAULT NULL,
  `shipUnitWeightUOM` varchar(45) DEFAULT NULL,
  `storageUnitUOM` varchar(45) DEFAULT NULL,
  `storageUnitLength` double DEFAULT NULL,
  `storageUnitWidth` double DEFAULT NULL,
  `storageUnitHeight` double DEFAULT NULL,
  `storageUnitDistanceUOM` varchar(45) DEFAULT NULL,
  `storageUnitWeight` double DEFAULT NULL,
  `shipUnitPerStorageUnit` double DEFAULT NULL,
  `storageUnitWeightUOM` varchar(45) DEFAULT NULL,
  `sellUnitPerStorageUnit` varchar(45) DEFAULT NULL,
  `storageUnitMaxStack` double DEFAULT NULL,
  `storageUnitMaxStackWeight` double DEFAULT NULL,
  `nmfcCode` varchar(45) DEFAULT NULL,
  `ltlCode` varchar(45) DEFAULT NULL,
  `productionLeadTime` int(11) DEFAULT NULL,
  `excludeFromCourier` tinyint(1) DEFAULT NULL,
  `splHandlingInstructions` text,
  `splPackageInstructions` text,
  `isMadeToOrder` tinyint(4) DEFAULT NULL,
  `createdBy` varchar(100) DEFAULT NULL,
  `updatedBy` varchar(100) DEFAULT NULL,
  `createdTime` bigint(20) DEFAULT NULL,
  `updatedTime` bigint(20) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `msgKey` bigint(20) NOT NULL,
  `msgSequenceNumber` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  `productType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `row_ID_UNIQUE` (`rowID`),
  KEY `fk_inv_sku_data_key1` (`categoryID`),
  KEY `fk_inv_sku_data_key2` (`brandID`),
  KEY `fk_inv_sku_data_key3` (`supplierID`),
  KEY `idx_sku_number` (`skuNumber`),
  KEY `supplierid_skunumber_index` (`supplierID`,`skuNumber`),
  KEY `rowCreatedIndex` (`rowCreatedEpoch`),
  KEY `rowUpdatedIndex` (`rowUpdatedEpoch`),
  KEY `idx_msgKey` (`msgKey`),
  KEY `idx_msgSeqNum` (`msgSequenceNumber`),
  KEY `idx_status` (`status`),
  KEY `idx_productID` (`productID`),
  KEY `madeToOrder` (`isMadeToOrder`)
) ENGINE=InnoDB AUTO_INCREMENT=1334951 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_skuDealsMap`
--

DROP TABLE IF EXISTS `inv_skuDealsMap`;

CREATE TABLE `inv_skuDealsMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `skuNumber` bigint(20) NOT NULL,
  `dealObjectKey` varchar(255) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `bannerOnProducts` varchar(255) DEFAULT NULL,
  `promotionType` varchar(255) DEFAULT NULL,
  `promotionSubType` varchar(255) DEFAULT NULL,
  `durationType` varchar(255) DEFAULT NULL,
  `skuSelection` varchar(255) DEFAULT NULL,
  `lifecycle` varchar(255) DEFAULT NULL,
  `promotionAmount` varchar(255) DEFAULT NULL,
  `promotionAmountType` varchar(255) DEFAULT NULL,
  `indexOrder` tinyint(1) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `sku_index` (`skuNumber`),
  KEY `startDate_index` (`startDate`),
  KEY `endDate_index` (`endDate`),
  KEY `deal_index` (`dealObjectKey`),
  KEY `sku_deal_index` (`skuNumber`,`dealObjectKey`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_skuPriceDetailsMap`
--

DROP TABLE IF EXISTS `inv_skuPriceDetailsMap`;

CREATE TABLE `inv_skuPriceDetailsMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `skuNumber` bigint(20) NOT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `minOrderQuantity` decimal(10,3) DEFAULT NULL,
  `indexOrder` tinyint(1) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `skuIndex` (`skuNumber`),
  KEY `rowCreatedIndex` (`rowCreatedEpoch`),
  KEY `rowUpdatedIndex` (`rowUpdatedEpoch`)
) ENGINE=InnoDB AUTO_INCREMENT=756326 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_skuTierDataMap`
--

DROP TABLE IF EXISTS `inv_skuTierDataMap`;

CREATE TABLE `inv_skuTierDataMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `skuNumber` bigint(20) DEFAULT NULL,
  `priceTier1` double DEFAULT NULL,
  `minOrderQuantityTier1` double DEFAULT NULL,
  `priceTier2` double DEFAULT NULL,
  `minOrderQuantityTier2` double DEFAULT NULL,
  `priceTier3` double DEFAULT NULL,
  `minOrderQuantityTier3` double DEFAULT NULL,
  `rowCreated` datetime NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `idx_skuNumber` (`skuNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=659470 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_skuWarehouseMap`
--

DROP TABLE IF EXISTS `inv_skuWarehouseMap`;

CREATE TABLE `inv_skuWarehouseMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `skuNumber` bigint(20) NOT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `shippingLeadTime` decimal(10,3) DEFAULT NULL,
  `leadtime` decimal(10,3) DEFAULT NULL,
  `cost` decimal(10,3) DEFAULT NULL,
  `initialInventory` decimal(10,3) DEFAULT NULL,
  `isSweepEnabled` tinyint(1) DEFAULT NULL,
  `indexOrder` tinyint(1) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  `costTier1` double DEFAULT NULL,
  `minOrderQuantityTier1` double DEFAULT NULL,
  `costTier2` double DEFAULT NULL,
  `minOrderQuantityTier2` double DEFAULT NULL,
  `costTier3` double DEFAULT NULL,
  `minOrderQuantityTier3` double DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `sku_wh_index` (`skuNumber`,`warehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=2197617 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_supplier`
--

DROP TABLE IF EXISTS `inv_supplier`;

CREATE TABLE `inv_supplier` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplierID` bigint(20) NOT NULL,
  `supplierName` varchar(256) DEFAULT NULL,
  `alias` varchar(256) DEFAULT NULL,
  `channel` varchar(45) DEFAULT NULL,
  `vendorCode` varchar(256) DEFAULT NULL,
  `billingAddressLine1` varchar(500) DEFAULT NULL,
  `billingAddressLine2` varchar(500) DEFAULT NULL,
  `billingAddressLine3` varchar(500) DEFAULT NULL,
  `billingAddressPostalCode` varchar(255) DEFAULT NULL,
  `billingAddressCity` varchar(255) DEFAULT NULL,
  `billingAddressState` varchar(255) DEFAULT NULL,
  `billingAddressCountry` varchar(255) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `msgKey` bigint(20) NOT NULL,
  `msgSequenceNumber` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`,`supplierID`),
  UNIQUE KEY `rowID` (`rowID`),
  UNIQUE KEY `supplierID_UNIQUE` (`supplierID`),
  UNIQUE KEY `msgKey_UNIQUE` (`msgKey`),
  KEY `supplierID` (`supplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=2929 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_supplierCategoryMap`
--

DROP TABLE IF EXISTS `inv_supplierCategoryMap`;

CREATE TABLE `inv_supplierCategoryMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplierID` bigint(20) DEFAULT NULL,
  `categoryID` bigint(20) DEFAULT NULL,
  `rowCreated` datetime DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `idx_supplierID` (`supplierID`),
  KEY `idx_categoryID` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=16455 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_supplierContactMap`
--

DROP TABLE IF EXISTS `inv_supplierContactMap`;

CREATE TABLE `inv_supplierContactMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplierID` bigint(20) NOT NULL,
  `contactID` bigint(20) NOT NULL,
  `isPrimaryContact` tinyint(2) DEFAULT NULL,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  UNIQUE KEY `sup_contact_unique` (`supplierID`,`contactID`),
  KEY `supplierIndex` (`supplierID`),
  KEY `contactIndex` (`contactID`)
) ENGINE=InnoDB AUTO_INCREMENT=12314 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_supplierWarehouseMap`
--

DROP TABLE IF EXISTS `inv_supplierWarehouseMap`;

CREATE TABLE `inv_supplierWarehouseMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `supplierID` bigint(20) DEFAULT NULL,
  `warehouseID` bigint(20) DEFAULT NULL,
  `rowCreated` datetime DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `idx_supplierID` (`supplierID`),
  KEY `idx_warehouseID` (`warehouseID`)
) ENGINE=InnoDB AUTO_INCREMENT=13652 DEFAULT CHARSET=latin1;


--
-- Table structure for table `inv_warehouse`
--

DROP TABLE IF EXISTS `inv_warehouse`;

CREATE TABLE `inv_warehouse` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouseID` bigint(20) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `alias` varchar(300) DEFAULT NULL,
  `address` text,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `postalcode` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `isSatellite` tinyint(1) DEFAULT NULL,
  `isBDWP` tinyint(1) DEFAULT NULL,
  `bdwpName` varchar(128) DEFAULT NULL,
  `daysUntilAgedInventory` bigint(20) DEFAULT NULL,
  `portalKey` varchar(300) DEFAULT NULL,
  `customerPickup` tinyint(1) DEFAULT NULL,
  `isSuperDC` tinyint(1) DEFAULT NULL,
  `isSweepEligible` tinyint(1) DEFAULT NULL,
  `isSweepEnabled` tinyint(1) DEFAULT NULL,
  `sweepsInto` bigint(20) DEFAULT NULL,
  `isPrimaryBDWP` tinyint(1) DEFAULT NULL,
  `rowCreated` datetime(6) NOT NULL,
  `rowCreatedEpoch` bigint(20) NOT NULL,
  `rowUpdated` datetime(6) NOT NULL,
  `rowUpdatedEpoch` bigint(20) NOT NULL,
  `msgKey` bigint(20) NOT NULL,
  `msgSequenceNumber` bigint(20) NOT NULL,
  `internalNote` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowID`,`warehouseID`),
  UNIQUE KEY `rowID` (`rowID`),
  UNIQUE KEY `warehouseID_UNIQUE` (`warehouseID`),
  UNIQUE KEY `msgKey_UNIQUE` (`msgKey`)
) ENGINE=InnoDB AUTO_INCREMENT=1705 DEFAULT CHARSET=utf8;


--
-- Table structure for table `inv_warehouseContactMap`
--

DROP TABLE IF EXISTS `inv_warehouseContactMap`;

CREATE TABLE `inv_warehouseContactMap` (
  `rowID` bigint(20) NOT NULL AUTO_INCREMENT,
  `warehouseID` bigint(20) NOT NULL,
  `contactID` bigint(20) NOT NULL,
  `rowCreated` datetime(6) DEFAULT NULL,
  `rowCreatedEpoch` bigint(20) DEFAULT NULL,
  `rowUpdated` datetime(6) DEFAULT NULL,
  `rowUpdatedEpoch` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowID`),
  KEY `warehouseIndex` (`warehouseID`),
  KEY `contactIndex` (`contactID`)
) ENGINE=InnoDB AUTO_INCREMENT=2163 DEFAULT CHARSET=latin1;


--
-- Table structure for table `list_values_mapping`
--

DROP TABLE IF EXISTS `list_values_mapping`;

CREATE TABLE `list_values_mapping` (
  `brickName` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `internalValue` varchar(255) DEFAULT NULL,
  `attributeName` varchar(255) DEFAULT NULL,
  KEY `idx_brick` (`brickName`),
  KEY `idx_internal` (`internalValue`),
  KEY `idx_brick_internal` (`brickName`,`internalValue`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Final view structure for view `activeSkusInventory`
--

/*!50001 DROP VIEW IF EXISTS `activeSkusInventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`inventory`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activeSkusInventory` AS select `a`.`skuNumber` AS `skuNumber`,`a`.`warehouseID` AS `warehouseID`,`a`.`onHandQty` AS `onHandLV`,`b`.`onHandquantity` AS `onhandInPH`,`b`.`minimumOrderQty` AS `minimumOrderQty`,`b`.`unProcessedQty` AS `unProcessedQty` from (`inv_inventoryMaster` `a` join `inv_onHandInventory_ims` `b` on(((`b`.`skuNumber` = `a`.`skuNumber`) and (`b`.`pimcoreWarehouseID` = `a`.`warehouseID`) and (`b`.`visibilityCode` <> 0)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allWarehouseSkuInventoryLV`
--

/*!50001 DROP VIEW IF EXISTS `allWarehouseSkuInventoryLV`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`inventory`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `allWarehouseSkuInventoryLV` AS select `lv`.`skuNumber` AS `skuNumber`,sum(`lv`.`onHandQty`) AS `totalStockLV` from (`inv_inventoryMaster` `lv` join `inv_onHandInventory_ims` `ph` on(((`ph`.`skuNumber` = `lv`.`skuNumber`) and (`ph`.`pimcoreWarehouseID` = `lv`.`warehouseID`) and (`ph`.`visibilityCode` <> 0)))) group by `lv`.`skuNumber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `allWarehouseSkuInventoryPH`
--

/*!50001 DROP VIEW IF EXISTS `allWarehouseSkuInventoryPH`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`inventory`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `allWarehouseSkuInventoryPH` AS select `inv_onHandInventory_ims`.`skuNumber` AS `skuNumber`,sum(`inv_onHandInventory_ims`.`onHandquantity`) AS `totalStockPH`,sum(`inv_onHandInventory_ims`.`unProcessedQty`) AS `totalUnprocessed`,`inv_onHandInventory_ims`.`minimumOrderQty` AS `minimumOrderQty`,sum(`inv_onHandInventory_ims`.`inboundInventory`) AS `totalInbound`,min(`inv_onHandInventory_ims`.`nextRestockDate`) AS `firstRestockDate`,max(`inv_onHandInventory_ims`.`nextRestockDate`) AS `lastRestockDate`,`inv_onHandInventory_ims`.`productAvailabilityUsage` AS `ProductAvailabilityUsage` from `inv_onHandInventory_ims` where (`inv_onHandInventory_ims`.`visibilityCode` <> 0) group by `inv_onHandInventory_ims`.`skuNumber`,`inv_onHandInventory_ims`.`minimumOrderQty`,`inv_onHandInventory_ims`.`productAvailabilityUsage` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-19 11:11:16
