SELECT 
	EventTBL.eventID, EventTBL.activityTitle, EventTBL.proposedVenue, EventTBL.pubmat, EventTBL.startDateTime,
	OrganizationTBL.organizationAcronym,
	RequestTBL.requestStatus
FROM RequestTBL INNER JOIN EventRequestTBL ON RequestTBL.requestID = EventRequestTBL.requestID
INNER JOIN EventTBL ON EventRequestTBL.eventID = EventTBL.eventID
INNER JOIN OrganizationTBL ON EventTBL.organizerID = OrganizationTBL.organizationID;