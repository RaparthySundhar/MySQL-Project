#CREATING DATABASE
CREATE DATABASE Library_management_system;

USE Library_management_system;

#CREATING TABLES
#-----------------------------------------------------------------------------------------------------------

#CREATING Publisher TABLE
CREATE TABLE Publisher (
	publisherName VARCHAR(100) PRIMARY KEY
    ,Publisheraddress TEXT
    ,phoneNO TEXT
    );

#CREATING Books TABLE
CREATE TABLE Books (
	book_id INT AUTO_INCREMENT PRIMARY KEY
    ,book_title TEXT
    ,bookpublisherName VARCHAR(100)
    ,CONSTRAINT fkpublisherName FOREIGN KEY (bookpublisherName) REFERENCES Publisher(publisherName)
);

#CREATING Library_branch TABLE
CREATE TABLE Library_branch (
	branch_id INT AUTO_INCREMENT PRIMARY KEY
    ,branchName VARCHAR(100)
    ,branchaddress VARCHAR(200)
);

#CREATING Customer TABLE
CREATE TABLE Customer (
	cardNo INT AUTO_INCREMENT PRIMARY KEY
    ,`Name` VARCHAR(100)
    ,Address VARCHAR(100)
    ,Phone VARCHAR(50)
);

#CREATING Loan Table
CREATE TABLE Loan (
	loan_id INT AUTO_INCREMENT PRIMARY KEY
    ,book_id INT
    ,branch_id INT
    ,cardno INT
    ,dateout TEXT
    ,datedue TEXT
    ,CONSTRAINT fkbookid FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ,CONSTRAINT fkbranchid FOREIGN KEY (branch_id) REFERENCES Library_branch(branch_id)
    ,CONSTRAINT fkcardno FOREIGN KEY (cardno) REFERENCES Customer(cardNo)
);

#CREATING book_copies TABLE
CREATE TABLE book_copies (
	copies_id INT AUTO_INCREMENT PRIMARY KEY
    ,book_id INT
    ,branch_id INT
    ,no_of_copies INT
    ,CONSTRAINT fkbook_id FOREIGN KEY (book_id) REFERENCES Books(book_id)
    ,CONSTRAINT fkbranch_id FOREIGN KEY (branch_id) REFERENCES Library_branch(branch_id)
);

#CREATING Author TABLE
CREATE TABLE Author (
	AuthorID INT AUTO_INCREMENT PRIMARY KEY
    ,BookID INT
    ,AuthorName VARCHAR(50)
    ,CONSTRAINT fkbook_id1 FOREIGN KEY (BookID) REFERENCES Books(book_id)
);

#-----------------------------------------------------------------------------------------------------------------

#INSERTING VALUES INTO TABLES
#-------------------------------------------------------------------------------------------------------------------

#INSERTING VALUES INTO Publisher TABLE

INSERT INTO publisher
		(publisherName, Publisheraddress, phoneNO)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');
        
SELECT * FROM publisher;

#INSERTING VALUES INTO Books TABLE

INSERT INTO books
		(book_title, bookpublisherName)
		VALUES 
		('The Name of the Wind', 'DAW Books'),
		('It', 'Viking'),
		('The Green Mile', 'Signet Books'),
		('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA');
        
SELECT * FROM Books;

#INSERTING VALUES INTO Library_branch TABLE

INSERT INTO Library_branch
	(branchName, branchaddress)
	VALUES
	('Sharpstown','32 Corner Road, New York, NY 10012'),
	('Central','491 3rd Street, New York, NY 10014'),
	('Saline','40 State Street, Saline, MI 48176'),
	('Ann Arbor','101 South University, Ann Arbor, MI 48104');
    
SELECT * FROM Library_branch;

#INSERTING VALUES INTO  TABLE

INSERT INTO Customer
		(`Name`, Address, Phone)
		VALUES
		('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');

SELECT * FROM Customer;

#INSERTING VALUES INTO TABLE 

INSERT INTO Loan
		(book_id, branch_id, cardno, dateout, datedue)
		VALUES
		('1','1','1','1/1/18','2/2/18'),
		('2','1','1','1/1/18','2/2/18'),
		('3','1','1','1/1/18','2/2/18'),
		('4','1','1','1/1/18','2/2/18'),
		('5','1','2','1/3/18','2/3/18'),
		('6','1','2','1/3/18','2/3/18'),
		('7','1','2','1/3/18','2/3/18'),
		('8','1','2','1/3/18','2/3/18'),
		('9','1','2','1/3/18','2/3/18'),
		('11','1','2','1/3/18','2/3/18'),
		('12','2','5','12/12/17','1/12/18'),
		('10','2','5','12/12/17','1/12/17'),
		('20','2','5','2/3/18','3/3/18'),
		('18','2','5','1/5/18','2/5/18'),
		('19','2','5','1/5/18','2/5/18'),
		('19','2','1','1/3/18','2/3/18'),
		('11','2','6','1/7/18','2/7/18'),
		('1','2','6','1/7/18','2/7/18'),
		('2','2','1','1/7/18','2/7/18'),
		('3','2','1','1/7/18','2/7/18'),
		('5','2','5','12/12/17','1/12/18'),
		('4','3','3','1/9/18','2/9/18'),
		('7','3','2','1/3/18','2/3/18'),
		('17','3','2','1/3/18','2/3/18'),
		('16','3','4','1/3/18','2/3/18'),
		('15','3','4','1/3/18','2/3/18'),
		('15','3','7','1/3/18','2/3/18'),
		('14','3','4','1/3/18','2/3/18'),
		('13','3','7','1/3/18','2/3/18'),
		('13','3','2','1/3/18','2/3/18'),
		('19','3','2','12/12/17','1/12/18'),
		('20','4','3','1/3/18','2/3/18'),
		('1','4','2','1/12/18','2/12/18'),
		('3','4','7','1/3/18','2/3/18'),
		('18','4','7','1/3/18','2/3/18'),
		('12','4','2','1/4/18','2/4/18'),
		('11','4','3','1/15/18','2/15/18'),
		('9','4','3','1/15/18','2/15/18'),
		('7','4','7','1/1/18','2/2/18'),
		('4','4','3','1/1/18','2/2/18'),
		('1','4','3','2/2/17','3/2/18'),
		('20','4','3','1/3/18','2/3/18'),
		('1','4','2','1/12/18','2/12/18'),
		('3','4','7','1/13/18','2/13/18'),
		('18','4', '7','1/13/18','2/13/18'),
		('12','4','2','1/14/18','2/14/18'),
		('11','4','3','1/15/18','2/15/18'),
		('9','4','3','1/15/18','2/15/18'),
		('7','4','7','1/19/18','2/19/18'),
		('4','4','3','1/19/18','2/19/18'),
		('1','4','3','1/22/18','2/22/18');
        
SELECT * FROM Loan;

#INSERTING VALUES INTO  TABLE

INSERT INTO book_copies
		(book_id,branch_id, no_of_copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');
        
SELECT * FROM book_copies;

#INSERTING VALUES INTO TABLE
	
INSERT INTO Author
	(BookID,AuthorName)
	VALUES
	('1','Patrick Rothfuss'),
	('2','Stephen King'),
	('3','Stephen King'),
	('4','Frank Herbert'),
	('5','J.R.R. Tolkien'),
	('6','Christopher Paolini'),
	('6','Patrick Rothfuss'),
	('8','J.K. Rowling'),
	('9','Haruki Murakami'),
	('10','Shel Silverstein'),
	('11','Douglas Adams'),
	('12','Aldous Huxley'),
	('13','William Goldman'),
	('14','Chuck Palahniuk'),
	('15','Louis Sachar'),
	('16','J.K. Rowling'),
	('17','J.K. Rowling'),
	('18','J.R.R. Tolkien'),
	('19','George R.R. Martin'),
	('20','Mark Lee');
    
SELECT * FROM Author;

#Questions for analysis

# 1) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

SELECT b.book_title,lb.branchName,COUNT(bc.copies_id) AS copy_count
FROM book_copies bc
INNER JOIN Books b ON bc.book_id = b.book_id
INNER JOIN Library_branch lb ON bc.branch_id = lb.branch_id
WHERE b.book_title = 'The Lost Tribe' AND lb.branchName = 'Sharpstown';

# 2)How many copies of the book titled "The Lost Tribe" are owned by each library branch? 

SELECT b.book_title,lb.branchName,COUNT(bc.copies_id) AS copy_count
FROM book_copies bc
INNER JOIN Books b ON bc.book_id = b.book_id
INNER JOIN Library_branch lb ON bc.branch_id = lb.branch_id
WHERE b.book_title = 'The Lost Tribe'
GROUP BY lb.branchName;

# 3) Retrieve the names of all borrowers who do not have any books checked out?

SELECT c.`Name` FROM customer c
LEFT JOIN loan l ON c.cardNo = l.cardNo
WHERE l.loan_id IS NULL;

# 4) Retrieve the names of all borrowers who have checked out  'The Name of the Wind'?

SELECT c.`Name` FROM customer c
LEFT JOIN loan l ON c.cardNo = l.cardNo
LEFT JOIN Books b ON b.book_id = l.book_id
WHERE book_title = 'The Name of the Wind';

#5) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.

SELECT b.book_title AS BookTitle, c.Name AS BorrowerName, c.Address AS BorrowerAddress FROM Loan l
INNER JOIN Books b ON l.book_id = b.book_id
INNER JOIN Customer c ON l.cardno = c.cardNo
INNER JOIN Library_branch lb ON l.branch_id = lb.branch_id
WHERE lb.branchName = 'Sharpstown' AND DATE(l.datedue) = CURDATE();

# 6) For each library branch, retrieve the branch name and the total number of books loaned out from that branch?

SELECT lb.branchName, COUNT(l.loan_id) AS total_books_loaned
FROM Library_branch lb
LEFT JOIN Loan l ON lb.branch_id = l.branch_id
GROUP BY lb.branch_id, lb.branchName;

# 7) Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out?

SELECT c.Name AS borrower_name, c.Address AS borrower_address, COUNT(l.cardno) AS num_books_checked_out
FROM Customer c
INNER JOIN Loan l ON c.cardNo = l.cardno
GROUP BY c.cardNo
HAVING COUNT(l.cardno) > 5;

# 8) For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central"?

SELECT b.book_title, bc.no_of_copies
FROM Books b
INNER JOIN Author a ON b.book_id = a.BookID
INNER JOIN book_copies bc ON b.book_id = bc.book_id
INNER JOIN Library_branch lb ON bc.branch_id = lb.branch_id
WHERE a.AuthorName = 'Stephen King' AND lb.branchName = 'Central';

# 9) How many copies of the book titled "The Habit" are owned by every branch?

SELECT lb.branchName, bc.no_of_copies
FROM Library_branch lb
INNER JOIN book_copies bc ON lb.branch_id = bc.branch_id
INNER JOIN Books b ON bc.book_id = b.book_id
WHERE b.book_title = 'The Habit';

# 10) Find number of books loaned by customer “Joe Smith”

SELECT COUNT(l.loan_id) AS num_books_loaned
FROM Loan l
INNER JOIN Customer c ON l.cardno = c.cardNo
WHERE c.Name = 'Joe Smith';










SELECT * FROM customer;
SELECT * FROM loan;
SELECT * FROM Books;
