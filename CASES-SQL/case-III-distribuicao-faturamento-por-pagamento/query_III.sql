with sellers as (
      select 
          seller_id,
          order_id,
          sum(price) + sum(freight_value) as valor_total 
       from tb_order_items
       group by 1,2
),

tipo_pagamento as (
      select 
          order_id,
          payment_type,
          sum(payment_value) as valor_pago
      from tb_order_payments
      group by 1,2
),

juncao as (
      select 
        s.seller_id,
        s.valor_total,
        p.payment_type,
        p.valor_pago
      from sellers s
      left join tipo_pagamento p 
      on s.order_id = p.order_id
),

tratamento as(
select 
  seller_id,
  sum(valor_total) as valor_total,
  case when payment_type = 'credit_card' then sum(valor_total) end as cartao_credito,
  case when payment_type = 'debit_card' then sum(valor_total) end as cartao_debito,
  case when payment_type = 'boleto' then sum(valor_total) end as boleto,
  case when payment_type = 'voucher' then sum(valor_total) end as voucher

from juncao
group by 1, payment_type
),

semifinal as(
select 
  seller_id,
  sum(valor_total) as valor_total,
  sum(cartao_credito) as credito,
  sum(cartao_debito) as debito,
  sum(boleto) as boleto,
  sum(voucher) as voucher
from tratamento
group by 1
)

select 
  seller_id,
  valor_total,
  round(coalesce((credito / valor_total),0) * 100) as perc_credito,
  round(coalesce((debito / valor_total),0) * 100 )as perc_debito,
  round(coalesce((boleto / valor_total),0) * 100 )as perc_boleto,
  round(coalesce((voucher / valor_total),0) * 100) as perc_voucher
from semifinal
group by 1,2

