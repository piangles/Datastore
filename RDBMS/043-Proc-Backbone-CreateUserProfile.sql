USE Backbone;
DROP PROCEDURE IF EXISTS CreateUserProfile;

DELIMITER //

CREATE PROCEDURE CreateUserProfile
(
	IN UserId VARCHAR(25),
	IN FirstName VARCHAR(50),
	IN LastName VARCHAR(50),
	IN EMailId VARCHAR(250)
) 
BEGIN
	#call DebugLog(ComponentId);

	INSERT INTO UserProfile (UserId, FirstName, LastName, EMailId)
	VALUES (UserId, FirstName, LastName, EMailId);
    
END //
DELIMITER ;
