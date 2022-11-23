declare @d float, @r float, @cv float, @dt float;
set @d=2
set @r=3
set @cv=(@d+@r)*2;
set @dt=@d*@r;
select 'Chu vi=',@cv;
select 'Dien tich=',@dt;