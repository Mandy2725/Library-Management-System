/* ======================================================
PROJECT: LIBRARY MANAGEMENT SYSTEM (V1.0)
DEVELOPER: [Mandy2725]
TOOLS: MySQL
======================================================
*/

CREATE DATABASE IF NOT EXISTS library;
USE library;

-- 1. BRANCH TABLE
CREATE TABLE Branch (
    Branch_no VARCHAR(10) PRIMARY KEY,
    Manager_id VARCHAR(10),
    Branch_address VARCHAR(50),
    Contact_no VARCHAR(15)
);
DESC Branch;

-- 2. EMPLOYEE TABLE
CREATE TABLE Employee (
    Emp_id VARCHAR(10) PRIMARY KEY,
    Emp_name VARCHAR(30),
    Position VARCHAR(30),
    Salary DECIMAL(10,2),
    Branch_no VARCHAR(10),
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no) ON DELETE SET NULL
);
DESC Employee;

-- 3. BOOKS TABLE
CREATE TABLE Books (
    ISBN VARCHAR(25) PRIMARY KEY,
    Book_title VARCHAR(80),
    Category VARCHAR(30),
    Rental_Price DECIMAL(10,2),
    Status ENUM('Yes','No') DEFAULT 'Yes',
    Author VARCHAR(30),
    Publisher VARCHAR(30)
);
DESC Books;

-- 4. CUSTOMER TABLE
CREATE TABLE Customer (
    Customer_Id VARCHAR(10) PRIMARY KEY,
    Customer_name VARCHAR(30),
    Customer_address VARCHAR(50),
    Reg_date DATE
);
DESC Customer;

-- 5. ISSUE STATUS (Transactions)
CREATE TABLE IssueStatus (
    Issue_Id VARCHAR(10) PRIMARY KEY,
    Issued_cust VARCHAR(10),
    Issued_book_name VARCHAR(80),
    Issue_date DATE,
    Isbn_book VARCHAR(25),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id) ON DELETE CASCADE,
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN) ON DELETE CASCADE
);
DESC IssueStatus;
# ISBN stands for International Standard Book Number.

-- 6. RETURN STATUS (Logs)
CREATE TABLE ReturnStatus (
    Return_id VARCHAR(10) PRIMARY KEY,
    Return_cust VARCHAR(30),
    Return_book_name VARCHAR(80),
    Return_date DATE,
    isbn_book2 VARCHAR(25),
    FOREIGN KEY (isbn_book2) REFERENCES Books(ISBN) ON DELETE CASCADE
);
DESC ReturnStatus;

-- ==========================================
-- 2. INSERT VALUES (The Data)
-- ==========================================


INSERT INTO branch VALUES
('B001', 'M101', '123 Main St', '+919099988676'),
('B002', 'M102', '456 Elm St', '+919099988677'),
('B003', 'M103', '789 Oak St', '+919099988678'),
('B004', 'M104', '567 Pine St', '+919099988679'),
('B005', 'M105', '890 Maple St', '+919099988680');
SELECT * FROM branch;


INSERT INTO employee VALUES
('E101', 'John Doe', 'Manager', 60000.00,'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00,'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00,'B003'),
('E104', 'Emily Davis', 'Assistant', 40000.00,'B004'),
('E105', 'Sarah Brown', 'Assistant', 42000.00,'B005');
SELECT * FROM employee;


INSERT INTO books VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', "Harry Potter and the Sorcerer's Stone", 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', "A People's History of the United States", 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'yes', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'yes', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'yes', 'Charles C. Mann', 'Vintage Books');
SELECT * FROM books;



INSERT INTO customer VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25');
SELECT * FROM CUSTOMER;



INSERT INTO IssueStatus VALUES
('IS101', 'C101', 'The Catcher in the Rye', '2023-05-01', '978-0-553-29698-2'),
('IS102', 'C102', 'The Da Vinci Code', '2023-05-02', '978-0-7432-4722-4'),
('IS103', 'C103', '1491: New Revelations of the Americas Before Columbus', '2023-05-03', '978-0-7432-7357-1'),
('IS104', 'C104', 'Sapiens: A Brief History of Humankind', '2023-05-04', '978-0-307-58837-1'),
('IS105', 'C105', 'The Diary of a Young Girl', '2023-05-05', '978-0-375-41398-8');
SELECT * FROM issuestatus;




INSERT INTO ReturnStatus VALUES
('RS101', 'C101', 'The Catcher in the Rye', '2023-06-06', '978-0-553-29698-2'),
('RS102', 'C102', 'The Da Vinci Code', '2023-06-07', '978-0-7432-4722-4'),
('RS103', 'C105', 'The Diary of a Young Girl', '2023-06-08', '978-0-375-41398-8'),
('RS104', 'C108', 'The Histories', '2023-06-09', '978-0-14-044930-3'),
('RS105', 'C110', 'A Game of Thrones', '2023-06-10', '978-0-09-957807-9');
SELECT * FROM returnstatus;




/*Queries*/

# 1. Retrieve the book title, category, and rental price of all available books.

SELECT 
    Book_title, Category, Rental_Price
FROM
    Books
WHERE
    Status = 'YES';


# 2. List the employee names and their respective salaries in descending order of salary.

SELECT 
    Emp_name, Salary
FROM
    employee
ORDER BY salary DESC;



# 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT 
    issuestatus.Issued_book_name,
    customer.Customer_name
FROM
    issuestatus
        INNER JOIN
    customer ON issuestatus.Issued_cust = customer.Customer_Id;
    
  
  
  # 4. Display the total count of books in each category.
    
SELECT 
    Category, COUNT(Book_title) AS Total_Books
FROM
    books
GROUP BY Category;


# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT 
    emp_name, Position
FROM
    employee
WHERE
    salary > 50000;



# 6. Display the branch numbers and the total count of employees in each branch.


SELECT 
    branch_no, COUNT(emp_id) AS total_count
FROM
    employee
GROUP BY branch_no;


# 7. Display the names of customers who have issued books in the month of May 2023.


SELECT 
    customer.Customer_name
FROM
    customer
        INNER JOIN
    issuestatus ON customer.Customer_Id = issuestatus.Issued_cust
WHERE
    issuestatus.Issue_date >= '2023-05-01'
        AND issuestatus.Issue_date <= '2023-05-30';



# 8. Retrieve book_title from book table containing 'history'.


SELECT 
    book_title
FROM
    books
WHERE
    Category = 'history';









