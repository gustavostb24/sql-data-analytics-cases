with sellers as (
      select 
            seller_id,
            sum(price) + sum(freight_value) as total_vendido,
            product_category_name
      from tb_order_items t1
      left join tb_products t2
      on t1.product_id = t2.product_id
      group by 1,3
      
),


 
tratamento as( 
select 
      seller_id,
      case when product_category_name like '%alimentos%' then sum(total_vendido) end as alimentos,
      case when product_category_name like '%construcao%' then sum(total_vendido) end as construcao,
      case when product_category_name like '%eletrodomesticos%' then sum(total_vendido) end as eletrodomesticos,
      case when product_category_name like '%fashion%' then sum(total_vendido) end as fashion,
      case when product_category_name like '%livros%' then sum(total_vendido) end as livros,
      case when product_category_name like '%moveis%' then sum(total_vendido) end as moveis,
      case when product_category_name like '%telefonia%' then sum(total_vendido) end as telefonia,
      case when product_category_name not like '%alimentos%'
                  and product_category_name not like '%construcao%'
                  and product_category_name not like '%eletrodomesticos%'
                  and product_category_name not like '%fashion%'
                  and product_category_name not like '%livros%'
                  and product_category_name not like '%moveis%'
                  and product_category_name not like '%telefonia%'
      then sum (total_vendido) end as 'outros'            
from sellers
group by seller_id, product_category_name
),

total_vendido as (
      select 
      seller_id,
      sum(total_vendido) as total_vendido
      from sellers
      group by 1
)

select 
      t1.seller_id,
      round(coalesce(sum(alimentos)/t2.total_vendido,0)* 100) as alimentos,
      round(coalesce(sum(construcao)/t2.total_vendido,0)* 100) as construcao,
      round(coalesce(sum(eletrodomesticos)/t2.total_vendido,0)* 100) as eletrodomesticos,
      round(coalesce(sum(fashion)/t2.total_vendido,0)* 100) as fashion,
      round(coalesce(sum(livros)/t2.total_vendido,0)* 100) as livros,
      round(coalesce(sum(moveis)/t2.total_vendido,0)* 100) as moveis,
      round(coalesce(sum(telefonia)/t2.total_vendido,0)* 100) as telefonia,
      round(coalesce(sum(outros)/t2.total_vendido,0)* 100) as outros
from tratamento t1
left join total_vendido t2
on t1.seller_id = t2.seller_id
group by 1

