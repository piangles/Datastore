USE Backbone;
DROP PROCEDURE IF EXISTS GetTopicsForUser;

DELIMITER //

CREATE PROCEDURE GetTopicsForUser
(
	IN UserId VARCHAR(12)
) 
BEGIN
	#call DebugLog(ComponentId);
	
    SELECT Topic from ControlChannel cc WHERE cc.TypeName = 'UserId' AND cc.TypeValue = UserId;
END //
DELIMITER ;
