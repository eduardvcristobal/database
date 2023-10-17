-- we don't know how to generate database archive (class Database) :(
create table event_logs
(
	id int identity
		primary key,
	method varchar(6),
	request_url varchar(200),
	request_param varchar(200),
	request_body nvarchar(max),
	created_by varchar(30),
	created_date datetime,
	duration int default 0,
	agent varchar(200),
	ip_address varchar(20),
	hash_value varbinary(max),
	application varchar(20)
)
go

create table config
(
	code varchar(20),
	value varchar(100),
	description varchar(100),
	id int identity
		primary key,
	method varchar(6),
	uri varchar(20)
)
go

CREATE procedure usp_insert_event_logs
  @method varchar(10) = '',
  @request_url varchar(200) ='',
  @request_param varchar(200) ='',
  @request_body nvarchar(MAX) = '',
  @created_by varchar(30) ='',
  @created_date datetime = null ,
  @duration INT = 0,
	@agent varchar(200)= '',
	@ipAddress varchar(20) = '',
  @hashValue varbinary(max) = null ,
  @application varchar(10) = ''
as

  INSERT INTO archive.dbo.event_logs(method, request_url, request_param, request_body, created_by, created_date, duration, agent, ip_address, hash_value, application)
  VALUES (@method, @request_url, @request_param, @request_body, @created_by, getdate(), @duration, @agent, @ipAddress, @hashValue, @application)

  select 1
go

create procedure usp_fg_encrypt(@username varchar(20), @password varchar(20))
AS
declare @id int select
        top 1 @id = id
    from
        archive.dbo.event_logs (nolock)
    where
        request_url = '/api/auth'
        and created_by = @username
    order by
        id desc update
            archive.dbo.event_logs
        set
            hash_value = ENCRYPTBYPASSPHRASE ('##Welcome@123', @password)
        where
            id =@id
go

