
# Library Management System

## Overview
This Library Management System is designed to manage the day-to-day operations of a library, providing functionalities for user management, book management, and circulation management. This project is built using Django and connects to a MySQL database using PyMySQL.

![Demo](https://github.com/tahsharaboochee/library-management/blob/main/static/images/library-management-demo.gif)

## Getting Started

### Prerequisites
- Python 3.x
- pip
- Virtual environment (recommended)

### Setting Up the Project
1. **Clone the Repository**
   ```
   git clone https://github.com/tahsharaboochee/library-management.git
   cd library-management
   ```

2. **Create and Activate Virtual Environment**
   - For Windows:
     ```
     python -m venv venv
     venv\Scripts\activate
     ```
   - For macOS/Linux:
     ```
     python3 -m venv venv
     source venv/bin/activate
     ```

3. **Install Dependencies**
   ```
   pip install -r requirements.txt
   ```

4. **Database Setup**
   - Create a MySQL database and user or use an existing one.
   - Update the `DATABASES` configuration in `settings.py` with your database credentials.
   - Load the initial data from the database dump file:
     ```
     mysql -u yourusername -p yourdatabase < library-management/dumpfile.sql
     ```

5. **Run Migrations**
   ```
   python manage.py migrate
   ```

6. **Start the Server**
   ```
   python manage.py runserver
   ```

## Dependencies
- **Django**: The web framework for perfectionists with deadlines.
- **PyMySQL**: A pure-Python MySQL client library.
- **Django REST Framework**: For building RESTful APIs.

## Routes and Authentication
- `/books/`: GET and POST routes to fetch and add books.
- `/users/login/`: Authentication route for user login.
- All routes are protected with JWT-based authentication ensuring secure access.

# Summary of Routes

## User Authentication Routes:
- `/login/`: Manages user login, authenticating users against the database.
- `/logout/`: Logs out a user, ending their session.
- `/register/`: Handles user registration, creating new user accounts and handling initial data collection like username, password, and email.

## Book Management Routes:
- `/books/`: Displays a list of all books, accessible to all users. Filters can be applied to search for specific books by title, author, or ISBN.
- `/books/:id/`: Shows details for a specific book, identified by its unique ID. This route is protected to ensure only authenticated users can access detailed information.
- `/books/:id/edit`: Allows editing details of a specific book. This route includes authorization to ensure only admins or authorized personnel can make changes.
- `/books/:id/delete`: Enables the deletion of a book record. Similar to editing, this route is secured to allow only authorized users to delete books.

## User Profile and Management Routes:
- `/profile/`: Displays the profile of the logged-in user, including personal information and borrowing history.
- `/profile/edit`: Allows users to edit their own profile information, such as address and phone number.
- `/admin/users/`: Admin route to manage all user accounts, including creation, modification, and deletion of user profiles.

## Circulation Management Routes:
- `/books/:id/checkout`: Handles the checkout process for a book. It includes authorization checks to ensure only logged-in users can check out books.
- `/books/:id/return`: Manages the return of borrowed books, also requiring user authentication.

## Search and Retrieval Routes:
- `/search/`: Provides a general search function accessible from most parts of the application, allowing users to search across different categories like books, authors, and ISBNs.

Each of these routes incorporates necessary security measures such as:

- Authentication checks to ensure that only logged-in users can access specific functionalities like checking out books or viewing personal profiles.
- Authorization checks to restrict sensitive actions (like editing or deleting book records) to users who have administrative privileges or specific roles within the system.

These routes form the backbone of the application, ensuring it operates securely and efficiently while providing users with a robust set of features tailored to library management.


## Tests
- **User Model Test**: Ensures user creation with unique email and hashed passwords.
- **Book Checkout Test**: Tests the checkout functionality, confirming the status change and correct transaction record creation.

# Summary of Tests

## Test of String Representation in BookModelTest class:
**Purpose:** This test verifies that the string representation of a Book object is correct, ensuring that the `__str__` method in the Book model concatenates the book's title and author in the expected format.  
**Methodology:** The test creates a Book instance with predefined attributes (title and author) and then checks if the output of the `__str__` method matches the expected string "1984 by George Orwell".

## Test of View Accessibility in BookListViewTest class:
**Purpose:** This test ensures that the book list view is accessible via its URL path and by its name, confirming that the route is correctly configured and that the view functions as intended.  
**Methodology:** The test attempts to access the view both directly through its URL path (`/catalog/books/`) and via the reverse function using the view's name (`book_list`). It checks that both access methods return an HTTP 200 status, indicating that the view is properly accessible.

These tests are essential for confirming fundamental functionalities of the application, such as model behavior and view accessibility, helping to maintain the integrity and reliability of the system as further changes and enhancements are implemented.

## Additional Notes

For more information on Django commands and management, refer to the official Django documentation.
