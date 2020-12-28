DROP FUNCTION IF EXISTS Backbone.SearchUserProfile;

CREATE FUNCTION Backbone.SearchUserProfile
(
	IN EMailId VARCHAR(250),
	IN PhoneNo VARCHAR(25),
	OUT UserId VARCHAR(25)
) 
AS $$
BEGIN

	IF EMailId IS NOT NULL THEN
		SELECT up.UserId INTO UserId FROM UserProfile up WHERE up.EMailId = EMailId;
    END IF;
    
	IF UserId IS NULL AND PhoneNo IS NOT NULL THEN
		SELECT up.UserId INTO UserId FROM UserProfile up WHERE up.PhoneNo = PhoneNo;	
	END IF;
    
END
$$ LANGUAGE plpgsql;