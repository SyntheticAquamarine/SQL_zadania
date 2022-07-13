Use Northwind

create table p (id_p int primary key identity,
imie varchar(30),
id_szefa int)

insert into p (imie) values ('szef'), ('podszef_1'), ('podszef_2'),
('wojtek'),('ewa'),('jacek'),('kasia'),('krzys')

select * from p

update p set id_szefa = 6 where id_p = 8---in (6,7)

select p1.imie, p2.imie, p3.imie from p p1 left join p p2 ---odniesienie tabeli do samej siebie
on p2.id_p=p1.id_szefa
left join p p3 on p3.id_p = p2.id_szefa

create table prac(poziom hierarchyid ,
imie varchar(30))

insert into prac values ('/','szef'),('/1/','podszef_1'),('/2/','podszef_2')
insert into prac values ('/1/1/','wojtek'),('/1/2/','ewa'),('/2/1/','zbigniew')
insert into prac values ('/2/2/','kasia'),('/2/1/1/','krzys')

select *, poziom.ToString() from prac where poziom.ToString() like '/2%'

select *, poziom.GetLevel() from prac

declare @szef hierarchyid
declare @prac1 hierarchyid
declare @prac2 hierarchyid
set @szef = (select poziom from prac where imie = 'krzys')
set @prac1 = (select poziom from prac where imie = 'jacek')
set @prac2 = (select poziom from prac where imie = 'wojtek')
---select @szef.GetAncestor(0).ToString()
---select @szef.GetDescendant(@prac1,@prac2).ToString()
select @prac1.IsDescendantOf(@szef)