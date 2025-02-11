

# Book Borrowing System

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Prerequisites](#prerequisites)
4. [Setup Instructions](#setup-instructions)
5. [Usage](#usage)
6. [Testing](#testing)


---

## Overview

The **Book Borrowing System** is a web application built with Ruby on Rails 8 that allows users to register, log in, browse books, borrow books, and manage their borrowed books. The system ensures that only available books can be borrowed and tracks due dates for borrowed books.

---

## Features

- **User Authentication**: Users can register, log in, and log out using Devise.
- **Book Management**: Books have a title, author, and ISBN (unique).
- **Borrowing System**: Users can borrow available books, and borrowing records are tracked with due dates.
- **User Profile**: Users can view their borrowed books and return them.
- **Validation**: Ensures data integrity by validating book attributes and preventing duplicate ISBNs.
- **Error Handling**: Prevents users from borrowing already borrowed books and handles other edge cases.

---

## Prerequisites

Before running this application, ensure you have the following installed:

- Ruby (>= 3.0)
- Rails (8.x)
- PostgreSQL or another supported database
- Bundler (`gem install bundler`)
- Node.js (for asset pipeline if needed)

---

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/amuybar/Library_App.git
   cd Library_App
   ```

2. **Install Dependencies**:
   ```bash
   bundle install
   ```

3. **Set Up the Database**:
   - Update `config/database.yml` with your database credentials if necessary.
   - Run the following commands:
     ```bash
     rails db:create
     rails db:migrate
     ```

4. **Seed the Database **:
   You can populate the database with sample data:
   ```bash
   rails db:seed
   ```

5. **Start the Server**:
   ```bash
   rails server
   ```
   Visit `http://localhost:3000` in your browser.

---

## Usage

### User Authentication
- Register a new user account or log in with an existing account.
- Log out when done.

### Book Management
- View all books on the home page.
- Click on a book to see its details.
- Borrow available books by clicking the "Borrow" button.

### User Profile
- Navigate to the profile page to view borrowed books.
- Return books by clicking the "Return" button next to the book.

---

## Testing

This application uses RSpec for testing. To run tests:


1. Run the test suite:
   ```bash
   bundle exec rspec

   ```

Ensure all tests pass before deploying or making changes.

