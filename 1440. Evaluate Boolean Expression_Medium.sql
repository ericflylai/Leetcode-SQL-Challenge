#Write an SQL query to evaluate the boolean expressions in Expressions table.

#Return the result table in any order.

# thought: need to join variables into expressions table
with a as(
select left_operand,operator,right_operand,a.value as avalue,b.value as bvalue from expressions 
left join variables a on a.name=left_operand
left join variables b on b.name=right_operand)
#lists all true conditions, others are false
select left_operand,operator,right_operand, case
when avalue>bvalue and operator ='>' then 'true'
when avalue=bvalue and operator ='=' then 'true'
when avalue<bvalue and operator ='<' then 'true'
else 'false' end as value
from a



