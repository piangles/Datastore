DROP PROCEDURE IF EXISTS Backbone.UpdateUserProfile;

CREATE PROCEDURE Backbone.UpdateUserProfile
(
	IN pUserId VARCHAR(25),
	IN pFirstName VARCHAR(50),
	IN pLastName VARCHAR(50),
	IN pEMailId VARCHAR(250),
	IN pPhoneNo VARCHAR(25)
) 
AS $$
BEGIN

	UPDATE Backbone.UserProfile up
		SET FirstName = pFirstName, LastName = pLastName, EMailId = pEMailId, PhoneNo = pPhoneNo
	WHERE UserId = pUserId;
    
END
$$ LANGUAGE plpgsql;