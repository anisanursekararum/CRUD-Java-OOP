SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Customer_Name` varchar(150) NOT NULL,
  `Customer_Add` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sales` (
  `Sales_ID` int(11) NOT NULL,
  `Sales_Date` date NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Customer_RefNo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sales_detail` (
  `Sales_ID` int(11) NOT NULL,
  `Shoes_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `shoes` (
  `Shoes_ID` int(11) NOT NULL,
  `Shoes_Name` varchar(50) NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

ALTER TABLE `sales`
  ADD PRIMARY KEY (`Sales_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

ALTER TABLE `sales_detail`
  ADD KEY `Shoes_ID` (`Shoes_ID`),
  ADD KEY `Sales_ID` (`Sales_ID`) USING BTREE;

ALTER TABLE `shoes`
  ADD PRIMARY KEY (`Shoes_ID`);


ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sales`
  MODIFY `Sales_ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `shoes`
  MODIFY `Shoes_ID` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

ALTER TABLE `sales_detail`
  ADD CONSTRAINT `sales_detail_ibfk_1` FOREIGN KEY (`Shoes_ID`) REFERENCES `shoes` (`Shoes_ID`),
  ADD CONSTRAINT `sales_detail_ibfk_2` FOREIGN KEY (`Sales_ID`) REFERENCES `sales` (`Sales_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
