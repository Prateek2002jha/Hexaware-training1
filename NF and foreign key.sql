create table TraineeSkills
(
TraineeId int identity(100,1) not null,
Trainee_name varchar(50),
skillId int  not null,
Trainee_skill varchar(50),
constraint PF_TSSID primary key (TraineeId, skillId, Trainee_skill)
)

-- insert values 
insert into Trainee(name,skill)
values
('Prateek','Python'),
('Varsha', 'C#'),
('Prithiv','SQL');

select * from Trainee

delete from Trainee where Id=102


insert into Trainee values ('Mihir','SQL');


drop table Trainee