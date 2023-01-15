/* We will be connecting to the Uni Database
To begin with  */

USE Uni; 

/*Core Learning 1 - Task 1*/

SELECT Avg(FullTimeFee) FROM fees;

/*Core Learning 1 - Task 2*/

SELECT * FROM fees
WHERE FullTimeFee > (SELECT Avg(FullTimeFee) FROM fees);

/*Core Learning 1 - Task 3*/

SELECT * FROM fees
ORDER BY FullTimeFee ASC;

/*Core Learning 2 - Task 1*/

SELECT * FROM Application
WHERE courseAppliedfor IS NULL;

/*Core Learning 2 - Task 2*/

SELECT * FROM Student 
WHERE StudentID IN 
                    (SELECT StudentID FROM Application
                    WHERE courseAppliedfor IS NOT NULL);

/*Core Learning 2 - Task 3*/
SELECT * FROM Student
WHERE DateOfBirth >= '2002-06-01' AND DateOfBirth < '2002-06-30';

/*Core Learning 2 - Task 4*/
SELECT * FROM Application
WHERE courseAppliedfor IS NULL AND Dateofapplication IN
                                        (SELECT Dateofapplication FROM Application
                                         WHERE Dateofapplication Between '2020-04-01' AND '2020-07-31');

/*Core Learning 3 - Task 1*/
SELECT CourseID,Count(CourseID) FROM module
WHERE CourseID IS NOT NULL
GROUP BY CourseID;

/*Core Learning 3 - Task 2*/
SELECT courseAppliedfor,Count(*)AS SuccessApplication FROM Application
WHERE Accepted = '1'
GROUP BY courseAppliedfor ;

/*Core Learning 3 - Task 3*/
SELECT SupervisingStaff,AVG(MembershipFee) FROM Club
GROUP BY SupervisingStaff;

/*Core Learning 3 - Task 4*/
SELECT SupervisingStaff,SUM(JoiningFee) FROM Club
WHERE Active = '1'
GROUP BY SupervisingStaff;

/*Core Learning 4 - Task 1*/

SELECT modulename,coursename FROM module
JOIN course  ON course.courseID=module.courseID

/*Core Learning 4 - Task 2*/
SELECT * FROM Student
JOIN Application on Application.StudentID = Student.StudentID

/*Core Learning 4 - Task 3*/
SELECT c.ClassID, Cdate, Feedbackscore FROM schedule as s
JOIN Class as c on c.ClassID=s.ClassID
ORDER BY scheduleId ASC

