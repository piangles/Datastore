USE Backbone;
DROP PROCEDURE IF EXISTS GetTopicsForUser;

DELIMITER //

CREATE PROCEDURE GetTopicsForUser
(
	IN UserId VARCHAR(12)
) 
BEGIN
	#call DebugLog(ComponentId);
	
    SELECT Topic from Messaging msg WHERE msg.TypeName = 'UserId' AND msg.TypeValue = UserId;
END //
DELIMITER ;
