SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE best_rent;
USE best_rent;

-- Table vehicle

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `vehicle_num` varchar(255) NOT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `available` varchar(255) NOT NULL,
  `car_status` varchar(255) NOT NULL,
  `mileage` int(11),
  `price` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Table customer

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  
  `name` varchar(255) NOT NULL,
  `credits` int(11) NOT NULL,
  `address` text NOT NULL,
  `mobile` bigint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Table rental

CREATE TABLE `rental` (
  `id` int(11) NOT NULL,
  `car_id` varchar(255) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Add primary key for vehicle
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

-- Add primary key for rental
ALTER TABLE `rental`
  ADD PRIMARY KEY (`id`);

-- Add foreign key for rental
ALTER TABLE `rental`
  ADD FOREIGN KEY (`cust_id`) REFERENCES `customer` (`id`);

-- AUTO_INCREMENT for vehicle
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- AUTO_INCREMENT for rental
ALTER TABLE `rental`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
