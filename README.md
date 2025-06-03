# Music Store Admin Web

This is a web-based admin dashboard for managing a music store, built using Java Server Pages (JSP) and backed by a MySQL database. It allows administrators to efficiently handle albums, orders, and clients, offering functionality for inventory management, customer data tracking, and order processing. The interface is designed for ease of use, with secure authentication and role-based access control.

![image](https://github.com/user-attachments/assets/3b71b355-79fb-4343-8179-28adb6bc17eb)


## Features

* User authentication system with login and sign-up functionality

![image](https://github.com/user-attachments/assets/7ae86b54-5d57-4e3c-aa64-6879cff52991)

  
* Role-based access control (Admin and regular users)
* Passwords are securely hashed before being stored in the database (no plain text storage)
* Admin capabilities:
  * Add, edit, and delete products (albums)
  * Add, edit, and delete clients
  * Add, edit, and delete customer orders
  * View transaction history and sales data

* Regular user capabilities:
  * Register a new account
  * Log in to view and interact with the music store
* Both regular users and administrators can click on the header of each table column to toggle between ascending and descending order
* Responsive admin interface using Bootstrap

![image](https://github.com/user-attachments/assets/49a31fb9-aaf3-4e65-a60b-76d1681eba41)


## Technologies Used

* **Frontend**: HTML, CSS, Bootstrap
* **Backend**: JSP (Java Server Pages)
* **Server**: Apache Tomcat 10
* **Database**: MySQL

## Setup Instructions

### Prerequisites

* Java Development Kit (JDK) >= 11
* Apache Tomcat 10
* MySQL
* IDE (IntelliJ IDEA, Eclipse) with servlet/JSP support

### Steps

1. **Clone the repository:**

   ```bash
   git clone https://github.com/stan4695/music_store_admin_web.git
   ```

2. **Import the project into your IDE:**

   * Import as a Java Web project depending on your setup

3. **Configure Apache Tomcat in your IDE**

   * Set up a Tomcat 10 server configuration and link the project to it

4. **Set up the database:**

   * Import the provided SQL file into MySQL:

     ```
     source absolute/path/to/scriptCreateDB.sql
     ```
   * Or use MySQL Workbench

5. **Configure database connection:**

   * Open the JavaBean file (JavaBean.java)
   * Set your DB host, user, password, and DB name in connect() method

6. **Run the app:**

   * Start the Tomcat server
   * Navigate to `http://localhost:8080/music_store_admin_web` in your browser

## Future Improvements

* Analytics and reporting features
* Advanced filtering/search for albums, artists, and users

