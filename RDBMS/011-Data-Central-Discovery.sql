USE Central;
DELETE FROM Discovery;

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'FeaturesTestService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'FeaturesTestService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'FeaturesTestService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'FeaturesTestService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'FeaturesTestService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'FeaturesTestService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'FeaturesTestService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'FeaturesTestService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'FeaturesTestService', 'RMQPort', '5672'),
('DEV', 'FeaturesTestService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'FeaturesTestService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'FeaturesTestService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'FeaturesTestService', 'DecrypterAuthorizationId', '3ba7c57e-0747-4da7-a85d-14daa39d3932'),
('DEV', 'FeaturesTestService', 'Topic', 'FeaturesTestServiceReqRespTopic'),
('DEV', 'FeaturesTestService', 'TimeOut', '5000');

#Tier 1
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'SessionManagementService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'SessionManagementService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'SessionManagementService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'SessionManagementService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'SessionManagementService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'SessionManagementService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'SessionManagementService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'SessionManagementService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'SessionManagementService', 'RMQPort', '5672'),
('DEV', 'SessionManagementService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'SessionManagementService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'SessionManagementService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'SessionManagementService', 'DecrypterAuthorizationId', '3ba7c57e-0747-4da7-a85d-14daa39d3932'),
('DEV', 'SessionManagementService', 'Topic', 'SessionManagementServiceReqRespTopic'),
('DEV', 'SessionManagementService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'ConfigService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'ConfigService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'ConfigService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.AuditableRequestCreator'),
('DEV', 'ConfigService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'ConfigService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'ConfigService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'ConfigService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'ConfigService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'ConfigService', 'RMQPort', '5672'),
('DEV', 'ConfigService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'ConfigService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'ConfigService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'ConfigService', 'DecrypterAuthorizationId', '6e3c9a60-4404-43a1-9702-1f3344bd06f1'),
('DEV', 'ConfigService', 'Topic', 'ConfigServiceReqRespTopic'),
('DEV', 'ConfigService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'CryptoService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'CryptoService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'CryptoService', 'RequestCreatorClassName', 'org.piangles.backbone.services.crypto.CryptoServiceRequestCreator'),
('DEV', 'CryptoService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'CryptoService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'CryptoService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'CryptoService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'CryptoService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'CryptoService', 'RMQPort', '5672'),
('DEV', 'CryptoService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'CryptoService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'CryptoService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'CryptoService', 'DecrypterAuthorizationId', '3466d438-4830-4d1a-847c-1a1e87612e9e'),
('DEV', 'CryptoService', 'Topic', 'CryptoServiceReqRespTopic'),
('DEV', 'CryptoService', 'TimeOut', '5000');

#Rest of the Backbone Services 
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'LoggingService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.FireAndForgetController'),
('DEV', 'LoggingService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.FireAndForgetHandler'),
('DEV', 'LoggingService', 'RequestCreatorClassName', 'org.piangles.backbone.services.logging.LoggingRequestCreator'),
('DEV', 'LoggingService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'LoggingService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'LoggingService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'LoggingService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'LoggingService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'LoggingService', 'RMQPort', '5672'),
('DEV', 'LoggingService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'LoggingService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'LoggingService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'LoggingService', 'DecrypterAuthorizationId', '6e3c9a60-4404-43a1-9702-1f3344bd06f1'),
('DEV', 'LoggingService', 'Topic', 'LoggingServiceFireAndForgetTopic'),
('DEV', 'LoggingService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'IdService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'IdService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'IdService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'IdService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'IdService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'IdService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'IdService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'IdService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'IdService', 'RMQPort', '5672'),
('DEV', 'IdService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'IdService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'IdService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'IdService', 'DecrypterAuthorizationId', '8e33bdae-a526-4d50-bf07-8f7c6c298c23'),
('DEV', 'IdService', 'Topic', 'IdServiceReqRespTopic'),
('DEV', 'IdService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'AuthenticationService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'AuthenticationService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'AuthenticationService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'AuthenticationService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'AuthenticationService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'AuthenticationService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'AuthenticationService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'AuthenticationService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'AuthenticationService', 'RMQPort', '5672'),
('DEV', 'AuthenticationService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'AuthenticationService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'AuthenticationService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'AuthenticationService', 'DecrypterAuthorizationId', 'fceeaacd-a8c4-4d4a-be4e-9ed025d55e0e'),
('DEV', 'AuthenticationService', 'Topic', 'AuthenticationServiceReqRespTopic'),
('DEV', 'AuthenticationService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'UserPreferenceService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'UserPreferenceService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'UserPreferenceService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'UserPreferenceService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'UserPreferenceService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'UserPreferenceService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'UserPreferenceService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'UserPreferenceService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'UserPreferenceService', 'RMQPort', '5672'),
('DEV', 'UserPreferenceService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'UserPreferenceService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'UserPreferenceService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'UserPreferenceService', 'DecrypterAuthorizationId', 'ba0b6173-b7ca-43e7-aee0-163233282403'),
('DEV', 'UserPreferenceService', 'Topic', 'UserPreferenceServiceReqRespTopic'),
('DEV', 'UserPreferenceService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'MessagingService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'MessagingService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'MessagingService', 'RequestCreatorClassName', 'org.piangles.backbone.services.msg.MessagingRequestCreator'),
('DEV', 'MessagingService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'MessagingService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'MessagingService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'MessagingService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'MessagingService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'MessagingService', 'RMQPort', '5672'),
('DEV', 'MessagingService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'MessagingService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'MessagingService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'MessagingService', 'DecrypterAuthorizationId', 'ba0b6173-b7ca-43e7-aee0-163233282403'),
('DEV', 'MessagingService', 'Topic', 'MessagingServiceReqRespTopic'),
('DEV', 'MessagingService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'UserProfileService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'UserProfileService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'UserProfileService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'UserProfileService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'UserProfileService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'UserProfileService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'UserProfileService', 'PreApprovedSessionId', 'TODOSessionId'),
('DEV', 'UserProfileService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'UserProfileService', 'RMQPort', '5672'),
('DEV', 'UserProfileService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'UserProfileService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'UserProfileService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'UserProfileService', 'DecrypterAuthorizationId', 'ba0b6173-b7ca-43e7-aee0-163233282403'),
('DEV', 'UserProfileService', 'Topic', 'UserProfileServiceReqRespTopic'),
('DEV', 'UserProfileService', 'TimeOut', '5000');
