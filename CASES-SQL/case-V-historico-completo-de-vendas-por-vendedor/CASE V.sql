with meses as(
      select
            distinct
            strftime('%Y-%m-01', order_approved_at) as mes_referencia,
            1 as key

      from tb_orders
      where mes_referencia is not null
      order by 1 asc
),

sellers as(
      select 
            t1.seller_id,
            min(strftime('%Y-%m-01',t2.order_approved_at)) as mes_primeira_venda,
            1 as key
      from tb_order_items t1
      left join tb_orders t2
      on t1.order_id = t2.order_id
      group by 1
),

cruzamento as(
      select 
            t1.mes_referencia,
            t2.seller_id,
            t2.mes_primeira_venda
      from meses t1
      left join sellers t2
      on t1.key = t2.key
      order by 2,1 asc
),

vendas as(
      select 
            t1.seller_id,
            strftime('%Y-%m-01',t2.order_approved_at) as mes_primeira_venda,
            sum(t1.price) + sum(t1.freight_value) as valor_venda
      from tb_order_items t1
      left join tb_orders t2
      on t1.order_id = t2.order_id
      group by 1,2
),

tabela_base as(
      select 
            t1.mes_referencia,
            t1.seller_id,
            t1.mes_primeira_venda,
            coalesce(sum(t2.valor_venda),0) as valor_venda
      from cruzamento t1
      left join vendas t2
      on t1.seller_id = t2.seller_id and t1.mes_referencia = t2.mes_primeira_venda
      group by 1,2,3
      order by t1.seller_id, t1.mes_referencia
),

ativo as (
      select 
            *,
            case when valor_venda > 0 then 1
                  else 0
            end as ativo
      from tabela_base
),


final as(
select 
      *,
      lag(ativo) over(partition by seller_id order by mes_referencia) as ativo_lag
from ativo
)

select 
      *,
      case 
            when mes_referencia < mes_primeira_venda then 'Prior Entry'
            when mes_referencia = mes_primeira_venda then 'New'
            when ativo = 1 and ativo_lag = 1 then 'Regular'
            when ativo = 0 then 'Churn'
            when ativo = 1 and ativo_lag = 0 then 'Recuperado'
         
     
      end as classificacao
from final

