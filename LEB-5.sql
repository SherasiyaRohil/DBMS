
	--->--->--->--->--->--->--->>> **** LEB-5 **** <<<---<---<---<---<---<---<---


	-------->>> *** ALTER,RENAME OPERATION *** <<<--------

	---*** PART=A QUEARY ***---

	--- ** Use Deposit table of lab-1 ** ---


--1. Add two more columns City VARCHAR (20) and Pincode INT.

	ALTER TABLE DEPOSIT
	ADD CITY VARCHAR(20),PINCODE INT;

	SELECT * FROM DEPOSIT


--2. Add column state VARCHAR(20).

	ALTER TABLE DEPOSIT
	ADD STATE VARCHAR(20);

	SELECT * FROM DEPOSIT

--3. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).

	ALTER TABLE DEPOSIT
	ALTER COLUMN CNAME VARCHAR(35);

	SELECT *FROM DEPOSIT

--4. Change the data type DECIMAL to INT in amount Column.

	ALTER TABLE DEPOSIT
	ALTER COLUMN AMOUNT INT;

	SELECT * FROM DEPOSIT
--5. Delete Column City from the DEPOSIT table.

	ALTER TABLE DEPOSIT
	DROP COLUMN CITY

	SELECT * FROM DEPOSIT


--6. Rename Column ActNo to ANO.

	SP_RENAME 'ACTNO','DEPOSIT.ANO';

--7. Change name of table DEPOSIT to DEPOSIT_DETAIL.
	
	SP_RENAME 'DEPOSIT','DEPOSIT_DETAIL';

	

