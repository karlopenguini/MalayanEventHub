﻿INSERT INTO EventTBL ( organizerID, activityTitle, audienceCollege, audienceDegree, audienceGradeYearStart, audienceGradeYearEnd, startDateTime, endDateTime, proposedVenue, objectives, details, pubmat, invitationLink) VALUES (0,'My Sample Event','CCIS','BSCS',1,3,'2022-05-29 13:00:00','2022-05-29 15:00:00','Discord','To Test Event Database','Inserted by Karlo',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Charles Secarro\source\repos\MalayanEventHub\Images\mcl_logo.png', SINGLE_BLOB) as T1),'www.google.com');
