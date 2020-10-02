USE Backbone;
DROP PROCEDURE IF EXISTS GetTopicsForEntities;

DELIMITER //

CREATE PROCEDURE GetTopicsForEntities
(
	IN EntityType VARCHAR(20),
	IN entityIdArray VARCHAR(250)
) 
BEGIN
	#call DebugLog(ComponentId);
	
    SELECT Topic, PartitionNo from MessagingEntities msg WHERE msg.TypeName = EntityType AND  FIND_IN_SET(msg.TypeValue, entityIdArray);
END //
DELIMITER ;
