create database ���ӿ�2;
use ���ӿ�2;

create table ����
(
����ID nchar(4) primary key,
�����W�� nchar(20)
);

create table ���u
(
���uID nchar(4) primary key,
���u�m�W nchar(20),
�ʧO nchar(1),
�����W�� nchar(10),
���ݳ���ID nchar(4),
foreign key (���ݳ���ID) references ����(����ID)
);

create table ���~
(
���~ID nchar(4) primary key,
���~�W�� nchar(20),
�w�� money
);

create table �P��
(
���uID nchar(4),
���~ID nchar(4),
�P��ƶq int,
primary key(���uID, ���~ID),
foreign key (���uID) references ���u(���uID),
foreign key (���~ID) references ���~(���~ID)
);

insert into ����
values ('D001','�`�g�z��'),('D002','�~�ȳ�'),('D003','��o��');

insert into ���u
values
('E001','Apple','�k','�~�ȳ�','D001'),('E002','Bob','�k','��o��','D002'),('E003','Catty','�k','�s�y��','D003'),('E004','David','�k','�~�ȳ�','D001'),
('E005','Frank','�k','��o��','D002'),('E006','Emy','�k','�s�y��','D003');

insert into ���~
values
('P001','���',2000),('P002','���q',3000),('P003','�O����',1000),('P004','��L',500),('P005','�ƹ�',100),('P006','�ù�',1500);

insert into �P��
values
('E001','P001',5),('E001','P002',2),('E001','P003',15),('E001','P004',25),('E001','P005',3),
('E002','P001',6),('E002','P002',15),('E002','P004',25),('E002','P005',25),('E002','P006',3),
('E003','P003',7),('E003','P002',4),('E004','P006',35),('E004','P002',15),('E004','P001',6),
('E005','P005',9),('E005','P003',55),('E005','P006',15),('E006','P001',5),('E006','P004',7);

select*
from ���u

select ���u�m�W,�����W��
from ���u

select ���~�W�� as �~�W,�w��
from ���~

select ���uID,�P��ƶq as �ƶq
from �P��
where ���~ID ='P005'

select ���uID,���~ID,�P��ƶq as �ƶq
from �P��
where �P��ƶq < 30

select ���uID,�P��ƶq as �ƶq
from �P��
where �P��ƶq > 5 and ���~ID ='P003'

select ���uID,���~ID,�P��ƶq as �ƶq
from �P��
where ���~ID ='P002' or ���~ID ='P004'

select ���uID,�P��ƶq as �ƶq
from �P��
where ���~ID ='P001' and not �P��ƶq >= 30

select ���uID,���~ID,�P��ƶq
from �P��
where �P��ƶq is null

select ���uID,���~ID,�P��ƶq
from �P��
where �P��ƶq is not null

select*
from ���u
where �����W�� like '��%'

select*
from ���~
where ���~�W�� like '%��%'

select*
from ���~
where ���~�W�� like '_��%'

select ���uID,���~ID,�P��ƶq as �ƶq
from �P��
where ���~ID in ('P001','P005')

select ���uID,���~ID,�P��ƶq
from �P��
where �P��ƶq between 15 and 30

select ���uID,���~ID,�P��ƶq
from �P��
where ���~ID in ('P002','P005') and �P��ƶq between 15 and 40

select ���uID,���~ID,�P��ƶq
from �P��
where ���~ID in ('P002','P005') and �P��ƶq >= 15 and �P��ƶq <= 60

select ���~ID,���~�W��,�w��,�w�� * 1.2 as ���
from ���~
where �w�� * 1.2 < 1000;

select ���~ID,���~�W��,�w��,�w�� * 1.2 as ���
from ���~

alter table ���~
add ���� money,
    ���~���� nvarchar(50),
    �s�y���� money;

insert into ���~(���~ID,���~�W��)
values
('P018','NVIDA��ܥd'),('P019','NVIDA CPU');

update ���~
set �s�y���� = 1400.0000
where ���~id = 'P001';

update ���~
set �s�y���� = 2100.0000
where ���~id = 'P002';

update ���~
set �s�y���� = 700.0000
where ���~id = 'P003';

update ���~
set �s�y���� = 350.0000
where ���~id = 'P004';

update ���~
set �s�y���� = 60.0000
where ���~id = 'P005';

update ���~
set �s�y���� = 1000.0000
where ���~id = 'P006';

update ���~
set �w�� = 8000.0000,
    �s�y���� = 5500.0000
where ���~id = 'P018';

update ���~
set �w�� = 9000.0000,
    �s�y���� = 6500.0000
where ���~id = 'P019';

update ���~
set ���~���� = '�q���s��'

update ���~
set ���~���� = '����'
where ���~�W�� like '%��%'

update ���~
set ���~���� = '���Źs��'
where ���~�W�� like '%NVIDA%'

update ���~
set ���� = �w�� * 0.8;

select *, �w�� - ���� as �Q��
from ���~

select *, �w�� - �s�y���� as �Q��
from ���~

select count(*) as ��ƪ���
from ���~

select count(���~�W��) as ���~�W�ٵ���
from ���~;

select count(�w��) as ���w��������
from ���~

select count(*) as ��ƪ���, count(���~�W��) as ���~�W�ٵ���, count(�w��) as ���w��������
from ���~

select count(�w��) as ���w��������, avg(�w��) as ���~������, sum(�w��) as �w�����`�M
from ���~

select count(�w��) as ���w��������, avg(�w��) as ���~������,
sum(�w��) as �w�����`�M, max(�w��) as �̰��w��, min(�w��) as �̧C�w��
from ���~

select count(�w��) as ���w��������, avg(�w��) as ���~������,
sum(�w��) as �w�����`�M, max(�w��) as �̰��w��, min(�w��) as �̧C�w��
from ���~
where ���~�W�� like '%��%'

select * from ���~
order by �w��;

select * from ���~
order by �w�� desc;

select * from ���~
order by �w�� desc, �s�y���� asc;

select ���~����, count(�w��) as ���w��������, avg(�w��) as ���~������,
sum(�w��) as �w�����`�M, max(�w��) as �̰��w��, min(�w��) as �̧C�w��
from ���~
group by ���~����

select ���~����, count(�w��) as ���w��������, avg(�w��) as ���~������,
sum(�w��) as �w�����`�M, max(�w��) as �̰��w��, min(�w��) as �̧C�w��
from ���~
group by ���~����
having count(�w��) > 0;

select * from �P��;
select ���uID from �P��;
select distinct ���uID from �P��;

select*
from ����, ���u

select*
from ����, ���u 
where ����.����ID = ���u.���ݳ���ID

select*
from ���� inner join ���u 
on ����.����ID = ���u.���ݳ���ID

select*
from ���� as a inner join ���u as b
on a.����ID = b.���ݳ���ID

select*
from ���� left outer join ���u 
on ����.����ID = ���u.���ݳ���ID 

select*
from ���� left outer join ���u 
on ����.����ID = ���u.���ݳ���ID
where ���u.���ݳ���ID is null

select*
from ���� right outer join ���u 
on ����.����ID = ���u.���ݳ���ID

select*
from ���� full outer join ���u
on ����.����ID = ���u.���ݳ���ID

select*
from ���u, �P��

select*
from ���u, �P��
where ���u.���uID = �P��.���uID

select*
from ���u inner join �P��
on ���u.���uID = �P��.���uID

select*
from ���u left outer join �P��
on ���u.���uID = �P��.���uID

select*
from ���u right outer join �P��
on ���u.���uID = �P��.���uID

select*
from ���u full outer join �P��
on ���u.���uID = �P��.���uID

select * from ���u

select * from �P�� where �P��ƶq > 20

select*
from ���u
where ���uID in (select ���uID from �P�� where �P��ƶq > 20)

select ���uID, sum(�P��ƶq) as �`�P��ƶq
from �P��
group by ���uID
order by sum(�P��ƶq) desc

select top 3 ���uID, sum(�P��ƶq) as �`�P��ƶq
from �P��
group by ���uID
order by sum(�P��ƶq) desc

select top 1 ���uID, sum(�P��ƶq) as �`�P��ƶq
from �P��
group by ���uID
order by sum(�P��ƶq) desc

select top 3 ���uID
from �P��
group by ���uID
order by sum(�P��ƶq)

select top 1 ���uID, sum(�P��ƶq) as �`�P��ƶq
from �P��
group by ���uID
order by sum(�P��ƶq) desc

select top 1 ���uID
from �P��
group by ���uID
order by sum(�P��ƶq) desc

select*
from ���u
where ���uID = (select top 1 ���uID from �P�� group by ���uID order by sum(�P��ƶq) desc)

select*
from ���u
where ���uID in (select top 3 ���uID from �P�� group by ���uID order by sum(�P��ƶq) desc)

create view ��������~�˵���view
as
select*
from dbo.���~
where �w�� > 1000;

update ��������~�˵���view
set ���� = �w�� * 0.5

create view ����R���uview
as
select ����ID,����.�����W��,���uID,���u�m�W
from dbo.���� inner join dbo.���u
on dbo.����.����ID = dbo.���u.���ݳ���ID