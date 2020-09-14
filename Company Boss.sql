/* write your SQL query below */

-- SELECT * FROM maintable_3DADC

-- select Position,
-- case ReportsTo
--   when 'Jenny Richards' then 'CEO'
--   else 'None'
-- end as 'Boss Title'
-- from maintable_3DADC

-- select 
--   Position
-- from maintable_3DADC
-- where
--   ReportsTo = 'Jenny Richards' or ReportsTo is null
-- order by Age

-- select BossTitle
-- from (
--   select Position,
--   case ReportsTo
--     when 'Jenny Richards' then 'CEO'
--     else 'None'
--   end as BossTitle
--   from maintable_3DADC
-- ) as BossTitle

-- select 
--   FirstName, 
--   LastName, 
--   ReportsTo, 
--   Position, 
--   Age
-- from maintable_3DADC
-- where
--   ReportsTo = 'Jenny Richards' or ReportsTo is null
-- order by Age

-- select Position
-- from maintable_3DADC
-- where
--   ReportsTo = 'Jenny Richards' or ReportsTo is null
-- order by Age

-- select 
--   FirstName, 
--   LastName, 
--   ReportsTo, 
--   Position, 
--   Age
-- from maintable_3DADC
-- where
--   ReportsTo = 'Jenny Richards' or ReportsTo is null
-- order by Age

-- select 
--   FirstName, 
--   LastName, 
--   ReportsTo, 
--   Position p, 
--   Age, 
--   (
--     select BossTitle
--     from (
--       select Position,
--       case ReportsTo
--         when 'Jenny Richards' then 'CEO'
--         else 'None'
--       end as BossTitle
--       from maintable_3DADC
--     ) as BossTitle
--     where BossTitle.Position = p
--   ) as 'Boss Title'
-- from maintable_3DADC
-- where
--   ReportsTo = 'Jenny Richards' or ReportsTo is null
-- order by Age

-- select Position,
-- case ReportsTo
--   when 'Jenny Richards' then 'CEO'
--   else 'None'
-- end as 'Boss Title'
-- from maintable_3DADC
-- select BossTitle

-- FINAL SCRIPT - SOLUTION
select
  table1.FirstName,
  table1.LastName,
  table1.ReportsTo,
  table1.Position,
  table1.Age,
  table2.BossTitle as 'Boss Title'
from maintable_3DADC as table1,
  (
  select Position,
    case ReportsTo
    when 'Jenny Richards' then 'CEO'
    else 'None'
  end as BossTitle
  from maintable_3DADC as BossTitle
) as table2
where table1.Position = table2.Position
  and table1.ReportsTo = 'Jenny Richards' or table1.ReportsTo is null
group by table1.ID
order by table1.Age

