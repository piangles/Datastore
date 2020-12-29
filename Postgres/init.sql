--Setup the timestamp for the database to be UTC
set timezone TO 'UTC';

--Add Extentions
--UUID related extenstions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE OR REPLACE FUNCTION public.update_updated_timestamp() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.updatedTS = now();
    RETURN NEW; 
END;
$$ language 'plpgsql';
CREATE SCHEMA IF NOT EXISTS Central;DROP TABLE IF EXISTS Central.Hosts;
CREATE TABLE Central.Hosts
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,

	Environment varchar(3) NOT NULL,
	Type varchar(25) NOT NULL,
	Purpose varchar(25) NOT NULL, 
	HostName varchar(255)  NOT NULL,
	Description varchar(1000)  NOT NULL
);
CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Central.Hosts FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP TABLE IF EXISTS Central.Discovery;
CREATE TABLE Central.Discovery
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	Environment varchar(3) NOT NULL,
	ServiceName varchar(50) NOT NULL,
	Name varchar(250) NOT NULL,
	Value varchar(1000) NOT NULL
);
CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Central.Discovery FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP TABLE IF EXISTS Central.Tier1Configuration;
CREATE TABLE Central.Tier1Configuration
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	Environment varchar(3) NOT NULL,
	ServiceName varchar(50) NOT NULL,
	Name varchar(250) NOT NULL,
	Value varchar(1000) NOT NULL
);
CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Central.Tier1Configuration FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();
DROP TABLE IF EXISTS Central.AuditCentral;
CREATE TABLE Central.AuditCentral
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),

	RemoteAddress varchar(50)  NOT NULL,
	RemoteHost varchar(255)  NOT NULL,
	RemotePort INT NOT NULL,
	RemoteUser varchar(50)  NULL,
	RequestedServiceName varchar(50) NULL,
	RequestedValue varchar(250) NULL
);
CREATE SCHEMA IF NOT EXISTS Backbone;CREATE SCHEMA IF NOT EXISTS BackboneAudit;DROP TABLE IF EXISTS Backbone.Config;
CREATE TABLE Backbone.Config
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,

	ApplicationId varchar(50) NOT NULL,
	ComponentId varchar(100) NOT NULL,
	ComponentDescription varchar(250) NOT NULL,
	Name varchar(100) NOT NULL,
	Value varchar(100) NOT NULL
);

CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.Config FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();
DROP TABLE IF EXISTS BackboneAudit.Config;
CREATE TABLE BackboneAudit.Config
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),

	HostName varchar(255)  NOT NULL,
	LoginId varchar(25)  NOT NULL,
	ProcessName varchar(50)  NOT NULL,
	ProcessId varchar(15)  NOT NULL,
	ThreadId varchar(50)  NOT NULL,

	ComponentId varchar(50)  NOT NULL,
	ClassName varchar(150) NOT NULL,
	LineNumber varchar(10) NOT NULL,
	StackTrace varchar(32000)  NOT NULL
);
DROP TABLE IF EXISTS BackboneAudit.Crypto;
CREATE TABLE BackboneAudit.Crypto
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
   
	TraceId varchar(36) NOT NULL,
	Action varchar(15) NOT NULL,
	Outcome varchar(10) NOT NULL,
	ResourceId varchar(50) NOT NULL,
	HostName varchar(255) NOT NULL,
	LoginId varchar(25) NOT NULL,
	ProcessName varchar(50) NOT NULL,
	ProcessId varchar(15) NOT NULL,
	ThreadId varchar(50) NOT NULL,
	AuthorizationId varchar(50) NOT NULL,
	ClassName varchar(150) NOT NULL,
	LineNumber varchar(10) NOT NULL,
	StackTrace varchar(32000) NOT NULL
);
DROP TABLE IF EXISTS Backbone.Logs;
CREATE TABLE Backbone.Logs
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	LoggingTS TIMESTAMP NOT NULL,

	TraceId VARCHAR(36) NULL,

	HostName varchar(255)  NOT NULL,
	LoginId varchar(25)  NOT NULL,
	ProcessName varchar(50)  NOT NULL,
	ProcessId varchar(15)  NOT NULL,
	
	ThreadId varchar(50)  NOT NULL,
	CategoryLevel INT NOT NULL,
	Category varchar(10) NOT NULL,
	ClassName varchar(150) NOT NULL,
	LineNumber varchar(10) NOT NULL,
	Message varchar(2048)  NULL,
	ExceptionStackTrace varchar(32000)  NULL
);
DROP TABLE IF EXISTS Backbone.UserPreferences;
CREATE TABLE Backbone.UserPreferences
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	UserId VARCHAR(25)  NOT NULL,
	Properties TEXT   NOT NULL
);


CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.UserPreferences FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP TABLE IF EXISTS Backbone.AddendumPreferences;
CREATE TABLE Backbone.AddendumPreferences
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,

	Action varchar(10) NOT NULL,
	Name varchar(100) NOT NULL,
	Value varchar(100) NOT NULL
);
CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.AddendumPreferences FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();
DROP TABLE IF EXISTS Backbone.MessagingAliases;
CREATE TABLE Backbone.MessagingAliases
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	Alias varchar(25)  NOT NULL,
	Topic varchar(150)  NOT NULL,
	PartitionNo INT DEFAULT -1
);

CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.MessagingAliases FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP TABLE IF EXISTS Backbone.MessagingEntities;
CREATE TABLE Backbone.MessagingEntities
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	TypeName varchar(25)  NOT NULL,
	TypeValue varchar(25)  NOT NULL,
	Topic varchar(150)  NOT NULL,
	PartitionNo INT DEFAULT -1
);

CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.MessagingEntities FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP TABLE IF EXISTS Backbone.MessagingTopicDetails;
CREATE TABLE Backbone.MessagingTopicDetails
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	Topic VARCHAR(150)  NOT NULL,
	PartitionerAlgorithm VARCHAR(50)  NOT NULL,
	Compacted BOOLEAN NOT NULL DEFAULT false
);

CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.MessagingTopicDetails FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP TABLE IF EXISTS Backbone.UserProfile;
CREATE TABLE Backbone.UserProfile
(
	Id SERIAL NOT NULL,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	UserId varchar(25)  NOT NULL  PRIMARY KEY,
	FirstName varchar(50)  NOT NULL,
	LastName varchar(50)  NOT NULL,
	EMailId varchar(250)  NOT NULL,
	PhoneNo varchar(25)  NOT NULL
);

CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.UserProfile FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP TABLE IF EXISTS Backbone.Credentials;
CREATE TABLE Backbone.Credentials
(
	Id SERIAL NOT NULL,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	UserId VARCHAR(25)  NOT NULL  PRIMARY KEY,
	LoginId VARCHAR(250)  NULL,
	Password VARCHAR(100) NULL,
	Token VARCHAR(100) NULL,
	TokenExpirationTime TIMESTAMP,
	
	NoOfAttempts INT NOT NULL DEFAULT 1,
	
	Active BOOLEAN NOT NULL DEFAULT true
);

CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.Credentials FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP TABLE IF EXISTS Backbone.TokenBasedCredentials;
CREATE TABLE Backbone.TokenBasedCredentials
(
	Id SERIAL NOT NULL,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	UserId VARCHAR(25)  NOT NULL,
	Token VARCHAR(100) NOT NULL PRIMARY KEY,
	TokenExpirationTime TIMESTAMP NULL,
	
	Active BOOLEAN NOT NULL DEFAULT true
);

CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.TokenBasedCredentials FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();DROP PROCEDURE IF EXISTS Backbone.CreateCredentialEntry;

CREATE PROCEDURE Backbone.CreateCredentialEntry
(
	IN UserId VARCHAR(25),
	IN LoginId VARCHAR(250),
	IN Password VARCHAR(100)
)
AS $$
BEGIN
	
    INSERT INTO Credentials (UserId, LoginId, Password)
    VALUES (UserId, LoginId, Password);
END
$$ LANGUAGE plpgsql;
DROP PROCEDURE IF EXISTS Backbone.CreateTokenBasedCredentialEntry;

CREATE PROCEDURE Backbone.CreateTokenBasedCredentialEntry
(
	IN UserId VARCHAR(25),
	IN Token VARCHAR(250)
) 
AS $$
BEGIN
	
    INSERT INTO TokenBasedCredentials (UserId, Token)
    VALUES (UserId, Token);
END
$$ LANGUAGE plpgsql;

DROP PROCEDURE IF EXISTS Backbone.CreateUserProfile;

CREATE PROCEDURE Backbone.CreateUserProfile
(
	IN UserId VARCHAR(25),
	IN FirstName VARCHAR(50),
	IN LastName VARCHAR(50),
	IN EMailId VARCHAR(250),
	IN PhoneNo VARCHAR(25)
) 
AS $$
BEGIN

	INSERT INTO UserProfile (UserId, FirstName, LastName, EMailId, PhoneNo)
	VALUES (UserId, FirstName, LastName, EMailId, PhoneNo);
    
END
$$ LANGUAGE plpgsql;
DROP PROCEDURE IF EXISTS Backbone.GetConfiguration;

CREATE PROCEDURE Backbone.GetConfiguration 
(
	IN ComponentId VARCHAR(255)
)
AS $$
BEGIN
	
    SELECT Name, Value from Config config WHERE config.ComponentId = ComponentId;
END
$$ LANGUAGE plpgsql;
DROP PROCEDURE IF EXISTS Backbone.GetPartitionerAlgorithmForTopics;

CREATE PROCEDURE Backbone.GetPartitionerAlgorithmForTopics
(
)
AS $$
BEGIN
	
    SELECT Topic, PartitionerAlgorithm from MessagingTopicDetails;
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Backbone.GetTopicDetails;

CREATE PROCEDURE Backbone.GetTopicDetails
(
	IN Topic VARCHAR(250)
) 
AS $$
BEGIN
	
    SELECT topicDetails.Topic, topicDetails.PartitionerAlgorithm, topicDetails.Compacted 
    FROM MessagingTopicDetails topicDetails
    WHERE topicDetails.Topic = Topic;
END
$$ LANGUAGE plpgsql;
DROP PROCEDURE IF EXISTS Backbone.GetTopicsForAliases;

CREATE PROCEDURE Backbone.GetTopicsForAliases
(
	IN aliasArray VARCHAR(250)
) 
AS $$
BEGIN
	
	SELECT alias.Topic, alias.PartitionNo, topicDetails.Compacted FROM 
			MessagingAliases alias, MessagingTopicDetails topicDetails 
	WHERE FIND_IN_SET(alias.Alias, aliasArray) and alias.Topic = topicDetails.Topic;
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Backbone.GetTopicsForEntities;

CREATE PROCEDURE Backbone.GetTopicsForEntities
(
	IN EntityType VARCHAR(20),
	IN entityIdArray VARCHAR(250)
)
AS $$
BEGIN
	
    SELECT entities.Topic, entities.PartitionNo,  topicDetails.Compacted
	FROM MessagingEntities entities 
	LEFT JOIN MessagingTopicDetails topicDetails ON
	entities.TypeName = EntityType AND  FIND_IN_SET(entities.TypeValue, entityIdArray)  AND entities.Topic = topicDetails.Topic;
END
$$ LANGUAGE plpgsql;
DROP PROCEDURE IF EXISTS Backbone.GetUserPreference;

CREATE PROCEDURE Backbone.GetUserPreference
(
	IN UserId VARCHAR(12)
)
AS $$
BEGIN
	
    SELECT Properties from UserPreferences prefs WHERE prefs.UserId = UserId;
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS BackboneAudit.InsertAuditConfig;

CREATE PROCEDURE BackboneAudit.InsertAuditConfig
(
	IN HostName varchar(255),
	IN LoginId varchar(25),
	IN ProcessName varchar(50),
	IN ProcessId varchar(15),
	IN ThreadId varchar(50),

	IN ComponentId varchar(50),
	IN ClassName varchar(150),
	IN LineNumber varchar(10),
	IN StackTrace varchar(32000)
)
AS $$
BEGIN

	INSERT INTO Config
	(
		HostName,
		LoginId,
		ProcessName,
		ProcessId,
		ThreadId,
		
		ComponentId,
		ClassName,
		LineNumber,
		StackTrace
	)
	VALUES
	(
		HostName,
		LoginId,
		ProcessName,
		ProcessId,
		ThreadId,

		ComponentId,
		ClassName,
		LineNumber,
		StackTrace
	);
	
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS BackboneAudit.InsertAuditCrypto;

CREATE PROCEDURE BackboneAudit.InsertAuditCrypto
(
	IN TraceId varchar(36),
	IN Action varchar(15),
	IN Outcome varchar(10),
	IN ResourceId varchar(50),

	IN HostName varchar(255),
	IN LoginId varchar(25),
	IN ProcessName varchar(50),
	IN ProcessId varchar(15),
	IN ThreadId varchar(50),
	
	IN AuthorizationId varchar(50),
	IN ClassName varchar(150),
	IN LineNumber varchar(10),
	IN StackTrace varchar(32000)
)
AS $$
BEGIN


	INSERT INTO Crypto
	(
		TraceId,
		Action,
		Outcome,
		ResourceId,
		
		HostName,
		LoginId,
		ProcessName,
		ProcessId,
		ThreadId,
		
		AuthorizationId,
		ClassName,
		LineNumber,
		StackTrace
	)
	VALUES
	(
		TraceId,
		Action,
		Outcome,
		ResourceId,
	
		HostName,
		LoginId,
		ProcessName,
		ProcessId,
		ThreadId,
		
		AuthorizationId,
		ClassName,
		LineNumber,
		StackTrace
	);
	
END
$$ LANGUAGE plpgsql;
DROP PROCEDURE IF EXISTS Backbone.InsertLog;

CREATE PROCEDURE Backbone.InsertLog 
(
	IN TraceId	varchar(36),
	IN LoggingTS TIMESTAMP,

	IN HostName varchar(255),
	IN LoginId varchar(25),
	IN ProcessName varchar(50),
	IN ProcessId varchar(15),
	
	IN ThreadId varchar(50),
	IN CategoryLevel INT,
	IN Category varchar(10),
	IN ClassName varchar(150),
	IN LineNumber varchar(10),
	IN Message varchar(2048),
	IN ExceptionStackTrace varchar(32000)
) 
AS $$
BEGIN

	INSERT INTO Logs
	(
		TraceId,
		LoggingTS,
	
		HostName,
		LoginId,
		ProcessName,
		ProcessId,
		
		ThreadId,
		CategoryLevel,
		Category,
		ClassName,
		LineNumber,
		Message,
		ExceptionStackTrace
	)
	VALUES
	(
		TraceId,
		LoggingTS,
	
		HostName,
		LoginId,
		ProcessName,
		ProcessId,
		
		ThreadId,
		CategoryLevel,
		Category,
		ClassName,
		LineNumber,
		Message,
		ExceptionStackTrace
	);
	
END
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Backbone.IsCredentialValid;

CREATE FUNCTION Backbone.IsCredentialValid
(
	IN LoginId VARCHAR(250),
	IN PasswordOrToken VARCHAR(100),
	IN MaxAttempts INT,
	OUT UserId VARCHAR(25),
	OUT NoOfAttempts INT,
	OUT IsToken BOOLEAN,
	OUT IsActive BOOLEAN
)
AS $$
	--TODO Fix this Found variable and also if the loginId is not even found currently returning \"AccountDisabled\\\"
	--TODO Enabled / Active
	DECLARE 
		Found BOOLEAN DEFAULT false;
BEGIN

	--Retrieve account is locked or MaxTries reached
	SELECT cred.Active, cred.NoOfAttempts INTO IsActive, NoOfAttempts 
	FROM Credentials cred 
	WHERE cred.LoginId = LoginId;
	
	--If max tries reached return, the user will have to generate token(again)
	IF IsActive = false OR NoOfAttempts > MaxAttempts THEN
		RETURN;
	END IF;
	
	--Check against the Password first
	SELECT cred.UserId, true INTO UserId, Found
	FROM Credentials cred 
	WHERE cred.LoginId = LoginId 
	AND cred.Password = PasswordOrToken;
	
	--Check against the Token
	IF Found = false THEN 
		SELECT cred.UserId, true, true INTO UserId, IsToken, Found 
		FROM Credentials cred 
		WHERE cred.LoginId = LoginId 
		AND cred.Token = PasswordOrToken  
		AND cred.TokenExpirationTime >= CURRENT_TIMESTAMP;
		
		IF Found = true THEN
			UPDATE Credentials cred
				SET cred.Password = '' 
			WHERE cred.LoginId = LoginId;
		END IF;
	END IF;	
	
	--Update NoOfAttempts accordingly
	IF Found = false THEN 
		SELECT cred.NoOfAttempts + 1 INTO NoOfAttempts FROM Backbone.Credentials cred WHERE cred.LoginId = LoginId;
	ELSE
		SET NoOfAttempts = 1;
	END IF;

	UPDATE Credentials cred
		SET cred.NoOfAttempts = NoOfAttempts 
	WHERE cred.LoginId = LoginId;
END
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Backbone.IsTokenBasedCredentialValid;

CREATE FUNCTION Backbone.IsTokenBasedCredentialValid
(
	IN Token VARCHAR(250),
	OUT UserId VARCHAR(25),
	OUT IsActive BOOLEAN
)
AS $$
BEGIN
	SELECT cred.UserId, cred.Active INTO UserId, IsActive
	FROM TokenBasedCredentials cred 
	WHERE cred.Token = Token;

END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Backbone.PutUserPreference;

CREATE PROCEDURE Backbone.PutUserPreference
(
	IN UserId VARCHAR(12),
	IN Properties TEXT
) 
AS $$
BEGIN

	INSERT INTO UserPreferences (UserId, Properties) VALUES (UserId, Properties) ON CONFLICT(UserId) DO UPDATE
	SET UserId = UserId, Properties = Properties;
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Backbone.RetrieveUserProfile;

CREATE PROCEDURE Backbone.RetrieveUserProfile
(
	IN UserId VARCHAR(25)
) 
AS $$
BEGIN

	SELECT UserId, FirstName, LastName, EMailId, PhoneNo FROM UserProfile up
	WHERE up.UserId = UserId;
    
END
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Backbone.SearchUserProfile;

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
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Backbone.SetCredential;

CREATE PROCEDURE Backbone.SetCredential
(
	IN UserId VARCHAR(25),
	IN LoginId VARCHAR(250),
	IN OldPassword VARCHAR(100),
	IN NewPassword VARCHAR(100),
	IN Token VARCHAR(100),
	IN TokenExpirationTime TIMESTAMP
) 
AS $$
BEGIN

	IF OldPassword IS NOT NULL AND NewPassword IS NOT NULL THEN
		--User is updating the password
		UPDATE Credentials cred 
			SET cred.Password = NewPassword
		WHERE cred.UserId = UserId AND cred.Password = OldPassword;
	ELSEIF LoginId IS NOT NULL AND Token IS NOT NULL AND TokenExpirationTime IS NOT NULL THEN
		--System is updating Token 
		UPDATE Credentials cred 
			SET cred.Token = Token, cred.TokenExpirationTime = TokenExpirationTime, cred.NoOfAttempts = 1
		WHERE cred.LoginId = LoginId;
	ELSEIF Token IS NOT NULL AND NewPassword IS NOT NULL THEN
		--User is in MidAuthentication phase and needs to update password
		UPDATE Credentials cred 
			SET cred.Password = NewPassword, cred.Token = NULL, cred.TokenExpirationTime = NULL, cred.NoOfAttempts = 1
		WHERE cred.UserId = UserId AND cred.Token = Token;
	END IF;
    
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Backbone.UpdateUserProfile;

CREATE PROCEDURE Backbone.UpdateUserProfile
(
	IN UserId VARCHAR(25),
	IN FirstName VARCHAR(50),
	IN LastName VARCHAR(50),
	IN EMailId VARCHAR(250),
	IN PhoneNo VARCHAR(25)
) 
AS $$
BEGIN

	UPDATE UserProfile up
		SET up.FirstName = FirstName, up.LastName = LastName, up.EMailId = EMailId, up.PhoneNo = PhoneNo
	WHERE up.UserId = UserId;
    
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Central.GetDiscoveryProperties;

CREATE PROCEDURE Central.GetDiscoveryProperties 
(
	IN HostName VARCHAR(255),
	IN ServiceName VARCHAR(255)
) 
AS $$
	DECLARE Environment VARCHAR(3);
BEGIN
    
	--Check if the Host is authorized need a separate point or return value.
	SELECT Environment INTO Central.Environment FROM Hosts hosts WHERE hosts.HostName=HostName;

	--call DebugLog(Environment);
	
	--If Properties are not set handle it.
    SELECT Name, Value FROM Central.Discovery discovery WHERE discovery.Environment = Environment and discovery.ServiceName = ServiceName;
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Central.GetTier1Configuration;

CREATE PROCEDURE Central.GetTier1Configuration 
(
	IN HostName VARCHAR(255),
	IN ServiceName VARCHAR(255)
) 
AS $$
	DECLARE Environment VARCHAR(3);
BEGIN
    
	SELECT hosts.Environment INTO Environment FROM Central.Hosts hosts WHERE hosts.HostName=HostName;

	--call DebugLog(Environment);
	
    SELECT Name, Value FROM Central.Tier1Configuration tier1Config WHERE tier1Config.Environment = Environment and tier1Config.ServiceName = ServiceName;
END
$$ LANGUAGE plpgsql;DROP PROCEDURE IF EXISTS Central.InsertAuditCentral;

CREATE PROCEDURE Central.InsertAuditCentral
(
	IN RemoteAddress varchar(50),
	IN RemoteHost varchar(255),
	IN RemotePort INT,
	IN RemoteUser varchar(50),
	IN RequestedServiceName varchar(50),
	IN RequestedValue varchar(250)
) 
AS $$
BEGIN

	INSERT INTO Central.AuditCentral
	(
		RemoteAddress,
		RemoteHost,
		RemotePort,
		RemoteUser,
		RequestedServiceName,
		RequestedValue
	)
	VALUES
	(
		RemoteAddress,
		RemoteHost,
		RemotePort,
		RemoteUser,
		RequestedServiceName,
		RequestedValue
	);
	
END
$$ LANGUAGE plpgsql;--DIFFERENT ISSUE
DROP FUNCTION IF EXISTS Central.ValidateDecryptRequest;

CREATE FUNCTION Central.ValidateDecryptRequest 
(
	IN HostName VARCHAR(255),
	IN ServiceName VARCHAR(255),
	IN EncryptedCategory VARCHAR(255), --Is it some Discovery Property or Config Property
	IN EncryptedValueName VARCHAR(255),
	IN EncryptedValue VARCHAR(255),
	IN CipherAuthorizationIdName VARCHAR(255),
	IN CipherAuthorizationId VARCHAR(255),
	OUT RowCount INT
) 
AS $$
	DECLARE 
		EncryptedRowCount INT;
		CipherRowCount INT;
		Environment VARCHAR(3);

BEGIN
	SELECT hosts.Environment into Environment FROM Central.Hosts hosts WHERE hosts.HostName=HostName;

	--call DebugLog(Environment);
	IF EncryptedCategory = 'Discovery' THEN
		SELECT COUNT(*) INTO EncryptedRowCount FROM Central.Discovery discovery  WHERE 
		discovery.Environment = Environment and 
		discovery.ServiceName = ServiceName and
		discovery.Name = EncryptedValueName and
		discovery.Value = EncryptedValue;

		SELECT COUNT(*) INTO CipherRowCount FROM Central.Discovery discovery  WHERE 
		discovery.Environment = Environment and 
		discovery.ServiceName = ServiceName and
		discovery.Name = CipherAuthorizationIdName and
		discovery.Value = CipherAuthorizationId;
		
		RowCount := EncryptedRowCount + CipherRowCount;
    ELSEIF EncryptedCategory = 'Configuration' THEN
    	SELECT COUNT(*) INTO EncryptedRowCount FROM Central.Tier1Configuration tier1Config WHERE 
		tier1Config.Environment = Environment and 
		tier1Config.ServiceName = ServiceName and    	
		tier1Config.Name = EncryptedValueName and
		tier1Config.Value = EncryptedValue;
		
		SELECT COUNT(*) INTO CipherRowCount FROM Central.Tier1Configuration tier1Config WHERE 
		tier1Config.Environment = Environment and 
		tier1Config.ServiceName = ServiceName and
		tier1Config.Name = CipherAuthorizationIdName and
		tier1Config.Value = CipherAuthorizationId;
		
    	RowCount := EncryptedRowCount + CipherRowCount;
	END IF;
	
END
$$ LANGUAGE plpgsql;--http://stackoverflow.com/questions/273437/how-do-you-debug-mysql-stored-procedures
DROP PROCEDURE IF EXISTS public.DebugLog;

CREATE PROCEDURE public.DebugLog
(
	msg VARCHAR(255)
)
AS $$
BEGIN
	select '** DEBUG:' ||  msg  AS DebugString;
END
$$ LANGUAGE plpgsql;