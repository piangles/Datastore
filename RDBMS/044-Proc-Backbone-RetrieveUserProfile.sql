USE Backbone;
DROP PROCEDURE IF EXISTS RetrieveUserProfile;

DELIMITER //

CREATE PROCEDURE RetrieveUserProfile
(
	IN UserId VARCHAR(25)
) 
BEGIN
	#call DebugLog(ComponentId);

	SELECT UserId, FirstName, LastName, EMailId FROM UserProfile up
	WHERE up.UserId = UserId;
    
END //
DELIMITER ;
