DROP FUNCTION IF EXISTS Backbone.RetrieveUserProfile;

CREATE FUNCTION Backbone.RetrieveUserProfile
(
	IN pUserId VARCHAR(25)
) 
RETURNS TABLE
(
	UserId VARCHAR(25),
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	EMailId VARCHAR(250),
	PhoneNo VARCHAR(25)
)
AS $$
BEGIN

	RETURN QUERY
	SELECT up.UserId, up.FirstName, up.LastName, up.EMailId, up.PhoneNo FROM Backbone.UserProfile up
	WHERE up.UserId = pUserId;
    
END
$$ LANGUAGE plpgsql;