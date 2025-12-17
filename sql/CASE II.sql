with customers as(
select 
      t1.customer_unique_id,
      t4.product_category_name,
      count(t3.order_id) as qntd_vendas,
      sum(t3.price) as valor_total
from tb_customers t1

left join tb_orders t2
on t1.customer_id = t2.customer_id

left join tb_order_items t3
on t2.order_id = t3.order_id

left join tb_products t4
on t3.product_id = t4.product_id

group by 1,2
),

rank as(
select 
      *,
      row_number() over(partition by customer_unique_id order by qntd_vendas desc, valor_total desc) as ranking
from customers
)

select * from rank
where ranking = 1 