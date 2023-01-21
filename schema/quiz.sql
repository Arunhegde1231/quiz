SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `leaderboard` ()  NO SQL
select q.quizname,s.score,s.totalscore,st.usn,st.name,s.usn
 from score s,student st,quiz q 
 where s.usn=st.usn and q.quizid=s.quizid 
 order by score DESC$$

DELIMITER ;


CREATE TABLE `dept` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `dept` (`dept_id`, `dept_name`) VALUES
(1, 'CSE'),
(2, 'ISE'),
(3, 'ECE'),
(4, 'EEE'),
(5, 'ME');

CREATE TABLE `questions` (
  `qs` varchar(200) NOT NULL,
  `op1` varchar(30) NOT NULL,
  `op2` varchar(30) NOT NULL,
  `op3` varchar(30) NOT NULL,
  `op4` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL,
  `quizid` int(11) NOT NULL,
  `question_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `questions` (`qs`, `op1`, `op2`, `op3`,`op4`, `answer`, `quizid`, `question_id`) VALUES
('What is the capital city of France?', 'Berlin', 'London', 'New Delhi', 'Paris','Paris', 1, 15),
('Which is the capital of Armenia?', 'Baku', 'Cairo', 'Tehran', 'Yerevan', 'Yerevan', 1, 16),
('Which is the capital of China?', 'Tokya', 'Seoul', 'Shangai', 'Beijing','Beijing',  1, 17),
('Which is the capital of Spain?', 'Rome', 'Barcelona', 'Paris', 'Madrid', 'Madrid', 1, 18),
('Which is the capital of Botswana?', 'Cape Town', 'Windhoek', 'Johannesburg', 'Gaborone','Gaborone', 1, 19);


CREATE TABLE `quiz` (
  `quizid` int(11) NOT NULL,
  `quizname` varchar(20) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `staffid` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `quiz` (`quizid`, `quizname`, `date_created`, `staffid`) VALUES
(1, 'World Capitals', '2022-28-12 17:43:34', '101');



DELIMITER $$
CREATE TRIGGER `ondeleteqs` AFTER DELETE ON `quiz` FOR EACH ROW delete from questions where questions.quizid=old.quizid
$$
DELIMITER ;

CREATE TABLE `score` (
  `slno` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `quizid` int(11) NOT NULL,
  `usn` varchar(30) NOT NULL,
  `totalscore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `score` (`slno`, `score`, `quizid`, `usn`, `totalscore`) VALUES
(34, 1, 1, '1bg20cs001', 6),
(35, 1, 1, '1bg20cs021', 1);


CREATE TABLE `staff` (
  `staffid` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `dept` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `student` (
  `usn` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `phno` varchar(10) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `dept` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `student` (`usn`, `name`, `mail`, `phno`, `gender`, `DOB`, `pw`, `dept`) VALUES
('1bg20cs001', 'Student', 'student@gmail.com', '8786788909', 'M', '2001-01-08', 'student@123', 'ISE'),
('1bg20cs021', 'Arun', 'arun@gmail.com', '9972343444', 'M', '2011-02-10', 'student@1', 'CSE'),
('1bg20cs069', 'Kirthi', 'kirthi@gmail.com', '9912313444', 'M', '2011-02-10', 'student@1', 'CSE');


ALTER TABLE `dept`
  ADD PRIMARY KEY (`dept_id`);


ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD UNIQUE KEY `qs` (`qs`),
  ADD KEY `quizid` (`quizid`),
  ADD KEY `quizid_2` (`quizid`),
  ADD KEY `quizid_3` (`quizid`);


ALTER TABLE `quiz`
  ADD PRIMARY KEY (`quizid`);

ALTER TABLE `score`
  ADD PRIMARY KEY (`slno`),
  ADD KEY `quizid` (`quizid`),
  ADD KEY `usn` (`usn`);


ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffid`),
  ADD UNIQUE KEY `mail` (`mail`,`phno`),
  ADD UNIQUE KEY `staffid` (`staffid`),
  ADD KEY `mail_2` (`mail`);


ALTER TABLE `student`
  ADD PRIMARY KEY (`usn`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `phno` (`phno`),
  ADD UNIQUE KEY `usn` (`usn`),
  ADD KEY `dept` (`dept`);


ALTER TABLE `questions`
  MODIFY `question_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;


ALTER TABLE `quiz`
  MODIFY `quizid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `score`
  MODIFY `slno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;


ALTER TABLE `score`
  ADD CONSTRAINT `score_ibfk_1` FOREIGN KEY (`quizid`) REFERENCES `quiz` (`quizid`) ON DELETE CASCADE,
  ADD CONSTRAINT `score_ibfk_3` FOREIGN KEY (`usn`) REFERENCES `student` (`usn`);
COMMIT;