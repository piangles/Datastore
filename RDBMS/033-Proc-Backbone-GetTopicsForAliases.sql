USE Backbone;
DROP PROCEDURE IF EXISTS GetTopicsForAliases;

DELIMITER //

CREATE PROCEDURE GetTopicsForAliases
(
	IN aliasArray VARCHAR(250)
) 
BEGIN
	#call DebugLog(ComponentId);
	
    SELECT Topic from Messaging msg WHERE msg.TypeName = 'Alias' AND FIND_IN_SET(msg.TypeValue, aliasArray);
END //
DELIMITER ;
