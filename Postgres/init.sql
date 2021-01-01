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
	PhoneNo varchar(25)
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
	
    INSERT INTO Backbone.Credentials (UserId, LoginId, Password)
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
	IN pUserId VARCHAR(25),
	IN pFirstName VARCHAR(50),
	IN pLastName VARCHAR(50),
	IN pEMailId VARCHAR(250),
	IN pPhoneNo VARCHAR(25)
) 
AS $$
BEGIN

	INSERT INTO Backbone.UserProfile (UserId, FirstName, LastName, EMailId, PhoneNo)
	VALUES (pUserId, pFirstName, pLastName, pEMailId, pPhoneNo);
    
END
$$ LANGUAGE plpgsql;
DROP FUNCTION IF EXISTS Backbone.GetConfiguration;

CREATE FUNCTION Backbone.GetConfiguration 
(
	IN pComponentId VARCHAR(255)
)
RETURNS TABLE (Name VARCHAR(250), Value VARCHAR(1000))
AS $$
BEGIN
	
	RETURN QUERY
    SELECT config.Name, config.Value FROM Backbone.Config config WHERE config.ComponentId = pComponentId;
END
$$ LANGUAGE plpgsql;
DROP FUNCTION IF EXISTS Backbone.GetPartitionerAlgorithmForTopics;

CREATE FUNCTION Backbone.GetPartitionerAlgorithmForTopics
(
)
RETURNS TABLE(Topic VARCHAR(150), PartitionerAlgorithm VARCHAR(50))
AS $$
BEGIN
	RETURN QUERY
    SELECT mtd.Topic, mtd.PartitionerAlgorithm FROM Backbone.MessagingTopicDetails mtd;
END
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Backbone.GetTopicDetails;

CREATE FUNCTION Backbone.GetTopicDetails
(
	IN pTopic VARCHAR(250)
)
RETURNS TABLE(	Topic VARCHAR(150), PartitionerAlgorithm VARCHAR(50), Compacted BOOLEAN)
AS $$
BEGIN
	
	RETURN QUERY
    SELECT topicDetails.Topic, topicDetails.PartitionerAlgorithm, topicDetails.Compacted 
    FROM Backbone.MessagingTopicDetails topicDetails
    WHERE topicDetails.Topic = pTopic;
END
$$ LANGUAGE plpgsql;
DROP FUNCTION IF EXISTS Backbone.GetTopicsForAliases;

CREATE FUNCTION Backbone.GetTopicsForAliases
(
	IN pAliasArray VARCHAR(250)
) 
RETURNS TABLE(Topic VARCHAR(25), PartitionNo INT, Compacted BOOLEAN)
AS $$
BEGIN
	
	RETURN QUERY
	SELECT alias.Topic, alias.PartitionNo, topicDetails.Compacted FROM 
			Backbone.MessagingAliases alias, Backbone.MessagingTopicDetails topicDetails 
	WHERE alias.Alias = ANY (string_to_array(pAliasArray,','))  AND alias.Topic = topicDetails.Topic;
END
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Backbone.GetTopicsForEntities;

CREATE FUNCTION Backbone.GetTopicsForEntities
(
	IN pEntityType VARCHAR(20),
	IN pEntityIdArray VARCHAR(250)
)
RETURNS TABLE(Topic varchar(150), PartitionNo INT, Compacted BOOLEAN)
AS $$
BEGIN
	
	RETURN QUERY
    SELECT entities.Topic, entities.PartitionNo,  topicDetails.Compacted
	FROM Backbone.MessagingEntities entities 
	LEFT JOIN Backbone.MessagingTopicDetails topicDetails ON
	entities.TypeName = pEntityType AND  entities.TypeValue = ANY (string_to_array(pEntityIdArray,','))
	AND entities.Topic = topicDetails.Topic;
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


	INSERT INTO BackboneAudit.Crypto
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
	IN pLoginId VARCHAR(250),
	IN pPasswordOrToken VARCHAR(100),
	IN pMaxAttempts INT,
	OUT pUserId VARCHAR(25),
	OUT pNoOfAttempts INT,
	OUT pIsToken BOOLEAN,
	OUT pIsActive BOOLEAN
)
AS $$
	--TODO Fix this Found variable and also if the loginId is not even found currently returning \"AccountDisabled\\\"
	--TODO Enabled / Active
	DECLARE 
		vFound BOOLEAN DEFAULT false;
BEGIN

	--Retrieve account is locked or MaxTries reached
	SELECT cred.Active, cred.NoOfAttempts INTO pIsActive, pNoOfAttempts 
	FROM Backbone.Credentials cred 
	WHERE cred.LoginId = pLoginId;
	
	--If max tries reached return, the user will have to generate token(again)
	IF pIsActive = false OR pNoOfAttempts > pMaxAttempts THEN
		RETURN;
	END IF;
	
	--Check against the Password first
	SELECT cred.UserId, true INTO pUserId, vFound
	FROM Backbone.Credentials cred 
	WHERE cred.LoginId = pLoginId 
	AND cred.Password = pPasswordOrToken;
	
	--Check against the Token
	IF vFound = false THEN 
		SELECT cred.UserId, true, true INTO pUserId, pIsToken, vFound 
		FROM Backbone.Credentials cred 
		WHERE cred.LoginId = pLoginId 
		AND cred.Token = pPasswordOrToken  
		AND cred.TokenExpirationTime >= CURRENT_TIMESTAMP;
		
		IF vFound = true THEN
			UPDATE Backbone.Credentials cred
				SET cred.Password = '' 
			WHERE cred.LoginId = pLoginId;
		END IF;
	END IF;	
	
	--Update NoOfAttempts accordingly
	IF vFound = false THEN 
		SELECT cred.NoOfAttempts + 1 INTO pNoOfAttempts FROM Backbone.Credentials cred WHERE cred.LoginId = pLoginId;
	ELSE
		pNoOfAttempts := 1;
	END IF;

	UPDATE Backbone.Credentials cred
		SET NoOfAttempts = pNoOfAttempts 
	WHERE cred.LoginId = pLoginId;
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
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Backbone.RetrieveUserProfile;

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
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Backbone.SearchUserProfile;

CREATE FUNCTION Backbone.SearchUserProfile
(
	IN pEMailId VARCHAR(250),
	IN pPhoneNo VARCHAR(25),
	OUT pUserId VARCHAR(25)
) 
AS $$
BEGIN

	IF pEMailId IS NOT NULL THEN
		SELECT up.UserId INTO pUserId FROM Backbone.UserProfile up WHERE up.EMailId = pEMailId;
    END IF;
    
	IF pUserId IS NULL AND pPhoneNo IS NOT NULL THEN
		SELECT up.UserId INTO pUserId FROM Backbone.UserProfile up WHERE up.PhoneNo = pPhoneNo;	
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
	IN pUserId VARCHAR(25),
	IN pFirstName VARCHAR(50),
	IN pLastName VARCHAR(50),
	IN pEMailId VARCHAR(250),
	IN pPhoneNo VARCHAR(25)
) 
AS $$
BEGIN

	UPDATE Backbone.UserProfile up
		SET FirstName = pFirstName, LastName = pLastName, EMailId = pEMailId, PhoneNo = pPhoneNo
	WHERE UserId = pUserId;
    
END
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Central.GetDiscoveryProperties;

CREATE FUNCTION Central.GetDiscoveryProperties 
(
	IN pHostName VARCHAR(255),
	IN pServiceName VARCHAR(255)
) 
RETURNS TABLE (Name VARCHAR(250), Value VARCHAR(1000))
AS $$
	DECLARE vEnvironment VARCHAR(3);
BEGIN
    
	--Check if the Host is authorized need a separate point or return value.
	SELECT hosts.Environment INTO vEnvironment FROM Central.Hosts hosts WHERE hosts.HostName=pHostName;

	--call DebugLog(Environment);
	
	--If Properties are not set handle it.
    RETURN QUERY 
    SELECT discovery.Name, discovery.Value FROM Central.Discovery discovery WHERE discovery.Environment = vEnvironment and discovery.ServiceName = pServiceName;
END
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Central.GetTier1Configuration;

CREATE FUNCTION Central.GetTier1Configuration 
(
	IN pHostName VARCHAR(255),
	IN pServiceName VARCHAR(255)
) 
RETURNS TABLE (Name VARCHAR(250), Value VARCHAR(1000))
AS $$
	DECLARE vEnvironment VARCHAR(3);
BEGIN
    
	SELECT hosts.Environment INTO vEnvironment FROM Central.Hosts hosts WHERE hosts.HostName=pHostName;

	--call DebugLog(Environment);
	RETURN QUERY
    SELECT tier1Config.Name, tier1Config.Value FROM Central.Tier1Configuration tier1Config 
    WHERE 
    tier1Config.Environment = vEnvironment and tier1Config.ServiceName = pServiceName;
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
$$ LANGUAGE plpgsql;DROP FUNCTION IF EXISTS Central.IsHostAuthorized;

CREATE FUNCTION Central.IsHostAuthorized 
(
	IN pHostName VARCHAR(255)
) 
RETURNS BOOLEAN
AS $$
DECLARE
  v_authorized BOOLEAN;
BEGIN

	SELECT EXISTS(SELECT 1 FROM Central.Hosts  WHERE hosts.HostName=pHostName) INTO v_authorized;

	RETURN v_authorized;
END
$$ LANGUAGE plpgsql;--DIFFERENT ISSUE
DROP FUNCTION IF EXISTS Central.ValidateDecryptRequest;

CREATE FUNCTION Central.ValidateDecryptRequest 
(
	IN pHostName VARCHAR(255),
	IN pServiceName VARCHAR(255),
	IN pEncryptedCategory VARCHAR(255), --Is it some Discovery Property or Config Property
	IN pEncryptedValueName VARCHAR(255),
	IN pEncryptedValue VARCHAR(255),
	IN pCipherAuthorizationIdName VARCHAR(255),
	IN pCipherAuthorizationId VARCHAR(255),
	OUT RowCount INT
) 
AS $$
	DECLARE 
		vEncryptedRowCount INT;
		vCipherRowCount INT;
		vEnvironment VARCHAR(3);

BEGIN
	SELECT hosts.Environment into vEnvironment FROM Central.Hosts hosts WHERE hosts.HostName=pHostName;

	--call DebugLog(Environment);
	IF pEncryptedCategory = 'Discovery' THEN
		SELECT COUNT(*) INTO vEncryptedRowCount FROM Central.Discovery discovery  WHERE 
		discovery.Environment = vEnvironment and 
		discovery.ServiceName = pServiceName and
		discovery.Name = pEncryptedValueName and
		discovery.Value = pEncryptedValue;

		SELECT COUNT(*) INTO vCipherRowCount FROM Central.Discovery discovery  WHERE 
		discovery.Environment = vEnvironment and 
		discovery.ServiceName = pServiceName and
		discovery.Name = pCipherAuthorizationIdName and
		discovery.Value = pCipherAuthorizationId;
		
		RowCount := vEncryptedRowCount + vCipherRowCount;
    ELSEIF pEncryptedCategory = 'Configuration' THEN
    	SELECT COUNT(*) INTO vEncryptedRowCount FROM Central.Tier1Configuration tier1Config WHERE 
		tier1Config.Environment = vEnvironment and 
		tier1Config.ServiceName = pServiceName and    	
		tier1Config.Name = pEncryptedValueName and
		tier1Config.Value = pEncryptedValue;
		
		SELECT COUNT(*) INTO vCipherRowCount FROM Central.Tier1Configuration tier1Config WHERE 
		tier1Config.Environment = vEnvironment and 
		tier1Config.ServiceName = pServiceName and
		tier1Config.Name = pCipherAuthorizationIdName and
		tier1Config.Value = pCipherAuthorizationId;
		
    	RowCount := vEncryptedRowCount + vCipherRowCount;
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