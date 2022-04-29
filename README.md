# :car: Best Rent: A Car Rental System

Best Rent is a car rental system built for Spring 2022 CS 411 B1 Project at Boston University. 

Language used: Java, MySQL, HTML and CSS

IDE: Eclipse IDE 2022-03, Visual Studio Code

The whole system is divided into two parts: *Rent_Terminal* is for the car rental company to manage cars, customers, and rental history. *Rent_CustomerWebsite* is a frontend webpage built for customers to see available cars and submit request for renting them. 

## :bulb: Features

### Company Side

On the company side, employees can add, delete and edit vehicles and customer information. Rental history will also be shown in the terminal.

### Customer Side

Customers can see an introduction to the company and to see the available cars and submit rental request through the website. 

## :camera: Screenshots

Company Terminal:
![Company Terminal](/Screenshots/terminal.png)

Customer Website:
![Customer Website](/Screenshots/webpage.png)

## :recycle: Environment

[JDK 17](https://www.oracle.com/java/technologies/downloads/#java17) used throughout the whole project.

[Apache Tomcat 10](https://tomcat.apache.org/download-10.cgi) used for the web project. 

[MySQL Connector Java 8.0.28](https://dev.mysql.com/downloads/connector/j/) for communication between Java and MySQL database.

## :wrench: Installation

:heavy_exclamation_mark: **Please make sure you have Apache Tomcat 10 and all the environment configered in Eclipse IDE.**
Company Terminal:
![Company Terminal](/Screenshots/RentTerminal.png)

Customer Website:
![Customer Website](/Screenshots/WebPage.png)

1. Execute best_rent.sql to create database schema
2. To launch the Company Terminal:
     1. Import Rent_Terminal into Eclipse
     2. For every Java class, please change your MySQL connections username and password
          (EX. Our connection link is (jdbc:mysql://localhost:3302/best_rent","root",""), maybe you should make some modifications here.)
     3. Run LoginPage.java
     4. Default account: Admin, password: 12345
3. To launch the Customer Website:
     1. Import Rent_CustomerWebsite into Eclipse
     2. Change your MySQL connections username and password in RentServlet.java and index.jsp
     3. Run index.jsp under webapp/index.jsp

## :notebook: Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## :black_nib: Author and Acknowledgment
This is a group project made by: Tianyi Bao [@bbbBao](https://github.com/bbbBao), Xiang Li [@GussLii](https://github.com/GussLii), Zijie Li [@lzivan](https://github.com/lzivan), Zhangde Song [@peteroldriver](https://github.com/peteroldriver)

Webpage CSS Templete from [W3.CSS](https://www.w3schools.com/w3css/default.asp)

Company Terminal referenced [tutussfunny](https://www.tutussfunny.com/car-rental-system-project-in-java/)
