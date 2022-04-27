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

-- Insert test cases to vehicle
INSERT INTO `vehicle` (`id`, `vehicle_num`, `make`, `model`, `available`, `car_status`, `mileage`, `price`) VALUES
(1, 'V0001', 'Toyota', 'Prius', 'Yes', 'Good', '26734', '100'),
(2, 'V0002', 'Toyota', 'Corolla', 'No', 'Good', '5367', '98'),
(3, 'V0003', 'Toyota', 'Camry', 'Yes', 'Good', '76382', '110'),
(4, 'V0004', 'Honda', 'Civic', 'No', 'Good', '29384', '98'),
(5, 'V0005', 'Honda', 'Accord', 'No', 'Good', '29401', '120'),
(6, 'V0006', 'Mazda', 'CX-5', 'Yes', 'Good', '100564', '87'),
(7, 'V0007', 'Mercedes', 'E350', 'Yes', 'Good', '8904', '520'),
(8, 'V0008', 'BMW', 'i7', 'No', 'Good', '1300', '300'),
(9, 'V0009', 'Toyota', 'Prius', 'No', 'Scrapped', '439284', '100'),
(10, 'V0010', 'BMW', 'X7', 'Yes', 'Good', '5632', '200'),
(11, 'V0011', 'Lamborghini', 'Aventador', 'Yes', 'Good', '3740', '790'),
(12, 'V0012', 'BMW', 'X3', 'No', 'Good', '20050', '150'),
(13, 'V0013', 'Tesla', 'Model S', 'Yes', 'Good', '9760', '200');

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
