DROP PROCEDURE IF EXISTS Backbone.CreateUserProfile;

CREATE PROCEDURE Backbone.CreateUserProfile
(
	IN pUserId VARCHAR(25),
	IN pFirstName VARCHAR(50),
	IN pLastName VARCHAR(50),
	IN pEMailId VARCHAR(250),
	IN pPhoneNo VARCHAR(25)
) 
AS $$
BEGIN

	INSERT INTO Backbone.UserProfile (UserId, FirstName, LastName, EMailId, PhoneNo)
	VALUES (pUserId, pFirstName, pLastName, pEMailId, pPhoneNo);
    
END
$$ LANGUAGE plpgsql;
