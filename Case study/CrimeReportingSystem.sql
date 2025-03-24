	use CrimeReportingSystem

	--This table stores information about various law enforcement or security agencies.

	create table security_agencies (
    securityagency_id int primary key identity(1,1),
    agency_name varchar(50) not null,
    region varchar(50) not null,
    contact_details varchar(50)
);



	--This table holds information about personnel, including officers and staff.
	create table personnel (
    personnel_id int primary key identity(1,1),
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    id_number varchar(50) unique not null,
    position varchar(50) not null,
    phone_number nvarchar(500),
    securityagency_id int not null,
    foreign key (securityagency_id) references security_agencies(securityagency_id) on delete cascade
);

	



	--Stores information about victims or affected individuals related to an event or incident.
	create table affectedpersons (
    affectedperson_id int primary key identity(1,1),
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    birth_date date not null,
    gender varchar(10) check (gender in ('male', 'female', 'other')),
    contact_details nvarchar(500)
);



	--Contains information about suspects or accused individuals related to an event.
create table accusedpersons (
    accusedperson_id int primary key identity(1,1),
    first_name varchar(50) not null,
    last_name nvarchar(50) not null,
    birth_date date not null,
    gender nvarchar(10) check (gender in ('male', 'female', 'other')),
    contact_details varchar(50)
);




	--Holds details of incidents or criminal events reported to the system.
	create table events (
    event_id int primary key identity(1,1),
    event_type nvarchar(100) not null,
    event_date datetime not null default getdate(),
    event_location geography not null,
    details nvarchar(max),
    current_status nvarchar(50) check (current_status in ('open', 'closed', 'under investigation')),
    affectedperson_id int not null,
    accusedperson_id int not null,
    securityagency_id int not null,
    foreign key (affectedperson_id) references affectedpersons(affectedperson_id),
    foreign key (accusedperson_id) references accusedpersons(accusedperson_id),
    foreign key (securityagency_id) references security_agencies(securityagency_id)
);




	--Contains records of evidence or artifacts related to events.
	create table artifacts (
    artifact_id int primary key identity(1,1),
    artifact_description nvarchar(max) not null,
    found_location nvarchar(255) not null,
    event_id int not null,
    foreign key (event_id) references events(event_id)
);



	-- Tracks official reports or documentation created by officers.
	create table documentation (
    documentation_id int primary key identity(1,1),
    event_id int not null,
    recorded_by int not null,
    documentation_date datetime not null default getdate(),
    documentation_details nvarchar(max),
    doc_status nvarchar(50) check (doc_status in ('draft', 'finalized')),
    foreign key (event_id) references events(event_id),
    foreign key (recorded_by) references personnel(personnel_id)
);


