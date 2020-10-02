USE Backbone;
DROP PROCEDURE IF EXISTS GetTopicsForAliases;

DELIMITER //

CREATE PROCEDURE GetTopicsForAliases
(
	IN aliasArray VARCHAR(250)
) 
BEGIN
	#call DebugLog(ComponentId);
	
    SELECT Topic, PartitionNo from MessagingAliases msg WHERE FIND_IN_SET(msg.Alias, aliasArray);
END //
DELIMITER ;
