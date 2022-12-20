2)	SELECT petName, petType
	FROM Pet;

3)	SELECT petName, petType
	FROM Pet
	WHERE dateRegistered LIKE '%01';
	
4)	SELECT CONCAT(sFName, CONCAT(' ' ,sLName)) AS Staff_Name
	FROM Staff
	WHERE position ! = 'manager' AND salary = (SELECT MAX(salary)
												FROM Staff
												WHERE position != 'manager');

5)	SELECT CONCAT(sFName, CONCAT(' ' ,sLName)) AS Staff_Name
	FROM Staff
	WHERE salary > (SELECT AVG(salary)
					FROM Staff);
					
6)	SELECT AVG((endDate - startDate)) AS Average_No_Of_Days
	FROM PetTreatment;

7)	SELECT C.clinicNo, C.city, C.state, PE.penNo, PE.penstatus
	FROM Clinic C, Pen PE
	WHERE C.clinicNo = PE.clinicNo
	ORDER BY C.clinicNo;
	
8)	SELECT S.SFName, S.sLName
	FROM Staff S, Clinic C
	WHERE S.position = 'manager' AND C.city = 'Brea' AND
	S.clinicNo = C.clinicNo;
		
9)	SELECT PO.oFName, PO.oLName
	FROM PetOwner PO, Pet P
	WHERE P.petType = 'Chihuahua' AND P.ownerNo = PO.ownerNo;
	
10)	SELECT CONCAT(PO.oFName, CONCAT(' ' ,Po.oLName)) AS Owner_Name
	FROM PetOwner PO, Clinic C
	WHERE C.city = 'Fullerton' AND C.clinicNo = PO.clinicNo;

11)	SELECT P.petName, P.petType
	FROM Pet P, Examination E, PetTreatment PT, Treatment T
	WHERE E.petNo = P.petNo AND E.examNo = PT.examNo AND T.treatNo = PT.treatNo AND
		 (PT.endDate - PT.startDate) > 2 AND T.cost > 100;

12)	SELECT sFName, sLName
	FROM Staff
	WHERE position = 'manager' AND clinicNo = 'Null';

13) SELECT P.petName, P.petType
	FROM Pet P, Examination E, PetTreatment PT, Treatment T
	WHERE E.petNo = P.petNo AND E.examNo = PT.examNo AND T.treatNo = PT.treatNo AND
		  T.cost = (SELECT MAX(cost)
					FROM Treatment);
					
14)	CREATE OR REPLACE VIEW MONTH AS
	SELECT TO_CHAR(dateRegistered, 'MONTH') AS Registered_Month, COUNT(*) AS No_of_Month_Count
	FROM Pet
	GROUP BY (TO_CHAR(dateRegistered, 'MONTH'))
	ORDER BY(COUNT(*)) DESC;
	
	SELECT TO_CHAR(dateRegistered, 'MONTH') AS Busiest_Month
	FROM Pet
	GROUP BY (TO_CHAR(dateRegistered, 'MONTH'))
	HAVING COUNT(*) = (SELECT MAX(No_of_Month_Count)
						FROM MONTH);


15) SELECT P.petType, AVG(T.cost) AS Average_cost
	FROM Treatment T, Examination E, PetTreatment PT, Pet P
	WHERE E.petNo = P.petNo AND E.examNo = PT.examNo AND Pt.treatNo = T.treatNo
	GROUP BY(P.petType);

16)	SELECT oFName, oLName
	FROM PetOwner PO, Pet P
	WHERE PO.ownerNo = p.ownerNo
	GROUP BY(oFName, oLName)
	HAVING COUNT(P.petNo) > 1;

17)	SELECT Phar.drugName, PharCliSto.inStock
	FROM Pharmacy Phar, PharmClinicStock PharCliSto
	WHERE Phar.drugNo = PharCliSto.drugNo AND PharCliSto.inStock < PharCliSto.reorderLevel
	ORDER BY(inStock);
 
18)	SELECT PO.oCity AS PetOwner_City, SUM(T.cost) AS Total_Cost
	FROM PetOwner PO, Pet P, PetTreatment PT, Treatment T, Examination E, Clinic C
	WHERE PO.ownerNo = P.ownerNo AND P.petNo = E.petNo AND E.examNo = PT.examNo AND Pt.treatNo = T.treatNo AND P.clinicNo = C.clinicNo
	GROUP BY(PO.oCity);