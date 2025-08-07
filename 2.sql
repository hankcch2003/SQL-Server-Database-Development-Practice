create database ���s���q;
use ���s���q;

create table ����
(
����id nchar(4) primary key,
�����W�� nchar(20)
);

create table ���u
(
���uid nchar(4) primary key,
���u�m�W nchar(20),
�ʧO nchar(1),
�����W�� nchar(10),  
���ݳ���id nchar(4),
foreign key (���ݳ���id) references ����(����id)
);

create table ���~
(
���~id nchar(4) primary key,
���~�W�� nchar(20),
�w�� money
);

create table �P��
(
���uid nchar(4),
���~id nchar(4),
�P��ƶq int,
primary key (���uid, ���~id),
foreign key (���uid) references ���u(���uid),
foreign key (���~id) references ���~(���~id)
);

insert into ����
values ('d001','�`�g�z��'),('d002','�~�ȳ�'),('d003','��o��');

insert into ���u
values
('e001','apple','�k','�~�ȳ�','d001'),('e002','bob','�k','��o��','d002'),
('e003','catty','�k','�s�y��','d003'),('e004','david','�k','�~�ȳ�','d001'),
('e005','frank','�k','��o��','d002'),('e006','emy','�k','�s�y��','d003');

insert into ���u (���uid, ���u�m�W, �ʧO)
values
('n001','amy�{�ɤH��','�k'),('n002','bob�{�ɤH��','�k'),
('n005','frank�{�ɤH��','�k'),('n006','emy�{�ɤH��','�k');

insert into ���~
values
('p001','���',2000),('p002','���',3000),('p003','�O����',1000),
('p004','��L',500),('p005','�ƹ�',100),('p006','�ù�',1500);

insert into ���~
values
('p007','�̦ѹ�',2000),('p008','�j�ѹ�',3000),('p009','�Ѫǹ�����',1000),
('p010','�����_',500),('p011','�������',100),('p012','�p�ѹ�',1500);

insert into �P��
values
('e001','p001',5),('e001','p002',2),('e001','p003',15),('e001','p004',25),('e001','p005',3),
('e002','p001',6),('e002','p002',15),('e002','p004',25),('e002','p005',25),('e002','p006',3),
('e003','p003',7),('e003','p002',4),('e004','p006',35),('e004','p002',15),('e004','p001',6),
('e005','p005',9),('e005','p003',55),('e005','p006',15),('e006','p001',5),('e006','p004',7);

-- 8-1 �d��
select * from �P��;
select ���uid, �ʧO, �����W�� from ���u;

-- 8-2 SELECT �l�y
select * from ���u where �ʧO='�k';
select * from ���u where ���ݳ���id='d001';
select ���uid as id, �ʧO as sex, �����W�� as dept from ���u;

-- 8-3 ����B��l
select * from �P�� where �P��ƶq > 10;
select * from �P�� where not �P��ƶq > 10;

-- 8-4 �޿�B��l
select * from ���u where �ʧO='�k' and �����W��='�~�ȳ�';
select * from ���u where not (�ʧO='�k' and �����W��='�~�ȳ�');
select * from ���u where �ʧO='�k' and not �����W��='�~�ȳ�';
select * from ���u where not �ʧO='�k' and �����W��='�~�ȳ�';
select * from ���u where �ʧO='�k' or �����W��='�~�ȳ�';
select * from ���u where not (�ʧO='�k' or �����W��='�~�ȳ�');
select * from ���u where not �ʧO='�k' or �����W��='�~�ȳ�';
select * from ���u where �ʧO='�k' or not �����W��='�~�ȳ�';

-- 8-5 �ҽk�d�߻P�d��d��
select * from ���~ where ���~�W�� like '%��%';
select * from ���~ where ���~�W�� like '��%';
select * from ���~ where ���~�W�� like '%��';
select * from ���~ where ���~�W�� like '_��%';

select * from ���~ where ���~id in ('p001','p005','p003');
select * from ���~ where ���~id='p001' or ���~id='p005' or ���~id='p003';

select * from ���~ where �w�� between 100 and 500;
select * from ���~ where �w�� between 100 and 500 and ���~�W�� like '%��%';
select * from ���~ where (�w�� >= 100 and �w�� <=500) and (���~�W�� like '%��%');

-- 8-6 ��N�B��l
select ���~id, ���~�W��, �w��, �w�� * 1.2 as ��� from ���~;
select ���~id, ���~�W��, �w��, �w�� * 1.2 as ��� from ���~ where �w�� * 1.2 < 1000;

alter table ���~ add ���� money;

update ���~ set ���� = �w�� * 0.8;

insert into ���~ (���~id, ���~�W��) values
('p013','nvida��ܥd'),('p014','nvida cpu');

select *, �w�� - ���� as �Q�� from ���~;

-- 8-7 �E�X���
select * from ���~;
select count(*) as ��ƪ��� from ���~;
select count(���~�W��) as ���~�W�ٵ��� from ���~;
select count(�w��) as ���w�������� from ���~;

select count(*) as ��ƪ���, count(���~�W��) as ���~�W�ٵ���, count(�w��) as ���w�������� from ���~;

select count(�w��) as ���w��������, avg(�w��) as �w��������, sum(�w��) as �w�����`�X from ���~;

select count(�w��) as ���w��������, avg(�w��) as �w��������, sum(�w��) as �w�����`�X, max(�w��) as �̰��w��, min(�w��) as �̧C�w�� from ���~;

select count(�w��) as ���w��������, avg(�w��) as �w��������, sum(�w��) as �w�����`�X, max(�w��) as �̰��w��, min(�w��) as �̧C�w�� from ���~ where ���~�W�� like '%��%';

-- 8-8 �Ƨ�
select * from ���~ order by �w��;
select * from ���~ order by �w�� desc;
select * from ���~ order by �w�� desc, ���� asc;

-- 8-9 �s�ջP HAVING
alter table ���~ add ���~���� nchar(20);

update ���~ set ���~���� = '�q���s��';
update ���~ set ���~���� = '����' where ���~�W�� like '%��%';
update ���~ set ���~���� = '���Źs��' where ���~�W�� like '%nvida%';

select ���~���� from ���~ group by ���~����;

select ���~����, count(�w��) as ���w��������, avg(�w��) as �w��������, sum(�w��) as �w�����`�X, max(�w��) as �̰��w��, min(�w��) as �̧C�w�� from ���~ group by ���~����;

select ���~����, count(�w��) as ���w��������, avg(�w��) as �w��������, sum(�w��) as �w�����`�X, max(�w��) as �̰��w��, min(�w��) as �̧C�w��
from ���~ group by ���~���� having count(�w��) > 0;

-- 8-10 DISTINCT
select * from �P��;
select ���uid from �P��;
select distinct ���uid from �P��;

-- 9-1~9-7 �X�֬d�߻P�_���d��
select * from ����, ���u;
select * from ����, ���u where ����.����id = ���u.���ݳ���id;

select * from ���� inner join ���u on ����.����id = ���u.���ݳ���id;
select * from ���� as a inner join ���u as b on a.����id = b.���ݳ���id;
select * from ���� left outer join ���u on ����.����id = ���u.���ݳ���id;

insert ���� values ('d004','�H�Ƴ�'),('d005','�]�ȳ�');

select * from ���� left outer join ���u on ����.����id = ���u.���ݳ���id where ���u.���ݳ���id is null;
select * from ���� right outer join ���u on ����.����id = ���u.���ݳ���id;
select * from ���� full outer join ���u on ����.����id = ���u.���ݳ���id;

select * from ���u, �P��;
select * from ���u, �P�� where ���u.���uid = �P��.���uid;
select * from ���u inner join �P�� on ���u.���uid = �P��.���uid;
select * from ���u left outer join �P�� on ���u.���uid = �P��.���uid;
select * from ���u right outer join �P�� on ���u.���uid = �P��.���uid;
select * from ���u full outer join �P�� on ���u.���uid = �P��.���uid;

select * from ���u;
select * from �P�� where �P��ƶq > 20;
select * from ���u where ���uid in (select ���uid from �P�� where �P��ƶq > 20);

select ���uid, sum(�P��ƶq) as �`�P��ƶq from �P�� group by ���uid order by sum(�P��ƶq) desc;
select top 3 ���uid, sum(�P��ƶq) as �`�P��ƶq from �P�� group by ���uid order by sum(�P��ƶq) desc;
select top 1 ���uid from �P�� group by ���uid order by sum(�P��ƶq) desc;

select * from ���u where ���uid = (
    select top 1 ���uid from �P�� group by ���uid order by sum(�P��ƶq) desc
);

select * from ���u where ���uid in (
    select top 3 ���uid from �P�� group by ���uid order by sum(�P��ƶq) desc
);

-- 10 view �إ�
use ���s���q;
go

create view ��������~view as
select * from dbo.���~ where �w�� > 1000;

update ��������~view
set ���� = �w�� * 0.5;

create view ����r���uview as
select ����id, ����.�����W��, ���uid, ���u�m�W
from dbo.���� inner join dbo.���u on dbo.����.����id = dbo.���u.���ݳ���id;