DROP FUNCTION IF EXISTS Backbone.SearchUserProfile;

CREATE FUNCTION Backbone.SearchUserProfile
(
	IN pEMailId VARCHAR(250),
	IN pPhoneNo VARCHAR(25),
	OUT pUserId VARCHAR(25)
) 
AS $$
BEGIN

	IF pEMailId IS NOT NULL THEN
		SELECT up.UserId INTO pUserId FROM Backbone.UserProfile up WHERE up.EMailId = pEMailId;
    END IF;
    
	IF pUserId IS NULL AND pPhoneNo IS NOT NULL THEN
		SELECT up.UserId INTO pUserId FROM Backbone.UserProfile up WHERE up.PhoneNo = pPhoneNo;	
	END IF;
    
END
$$ LANGUAGE plpgsql;