with sellers as (
    select
        t1.seller_id,
        t1.product_id,
        t2.product_category_name,
        count(*) as qtd_vendas,
        sum(t1.price) as total_vendido
    from tb_order_items t1
    left join tb_products t2 
        on t1.product_id = t2.product_id
    group by t1.seller_id, t1.product_id, t2.product_category_name
),

ranking as (
    select
        *,
        row_number() over (
            partition by seller_id
            order by qtd_vendas desc, total_vendido desc
        ) as rank_produto
    from sellers
)

select
    seller_id,
    product_id,
    product_category_name,
    qtd_vendas,
    total_vendido
from ranking
where rank_produto = 1;
