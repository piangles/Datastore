USE Backbone;
DELETE FROM Config WHERE ComponentId IN ('14fe64ea-d15a-4c8b-af2f-f2c7efe1943b');

INSERT INTO Config (ApplicationId, ComponentId, ComponentDescription, Name, Value) VALUES
('LoggingService', '14fe64ea-d15a-4c8b-af2f-f2c7efe1943b', 'LoggingService', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('LoggingService', '14fe64ea-d15a-4c8b-af2f-f2c7efe1943b', 'LoggingService', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('LoggingService', '14fe64ea-d15a-4c8b-af2f-f2c7efe1943b', 'LoggingService', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('LoggingService', '14fe64ea-d15a-4c8b-af2f-f2c7efe1943b', 'LoggingService', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('LoggingService', '14fe64ea-d15a-4c8b-af2f-f2c7efe1943b', 'LoggingService', 'DecrypterClassName', 'com.TBD.backbone.services.DefaultDecrypter'),
('LoggingService', '14fe64ea-d15a-4c8b-af2f-f2c7efe1943b', 'LoggingService', 'DecrypterAuthorizationId', 'e04202bc-a88e-48be-8b38-b94399d3086a');


--DELETE FROM Config WHERE ComponentId IN ('24765f79-834a-4761-9180-4e0450e6020b', '632cc560-841f-4551-bac6-232102ef5503');
--('LoggingPortal', '24765f79-834a-4761-9180-4e0450e6020b', 'LoggingPortal RegularController Properties', 'ActionServiceClassName', 'com.TBD.backbone.portal.logging.ActionServiceImpl'),
--('LoggingPortal', '24765f79-834a-4761-9180-4e0450e6020b', 'LoggingPortal RegularController Properties', 'LogQuery.query.Success', '/results.jsp'),
--('LoggingPortal', '24765f79-834a-4761-9180-4e0450e6020b', 'LoggingPortal RegularController Properties', 'LogQuery.query.Failure', '/error/404.jsp'),
--
--('LoggingPortal', '632cc560-841f-4551-bac6-232102ef5503', 'LoggingPortal Properties', 'DriverClassName', 'com.mysql.jdbc.Driver'),
--('LoggingPortal', '632cc560-841f-4551-bac6-232102ef5503', 'LoggingPortal Properties', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
--('LoggingPortal', '632cc560-841f-4551-bac6-232102ef5503', 'LoggingPortal Properties', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
--('LoggingPortal', '632cc560-841f-4551-bac6-232102ef5503', 'LoggingPortal Properties', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/');
