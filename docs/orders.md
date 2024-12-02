{% docs orders_table %}

Tabla de todos los pedidos existentes (todos los precios están 
expresados en euros).

{% enddocs %}

{% docs delivered_at %}

Marca temporal cuando el pedido fue entregado.
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs estimated_delivery_at %}

Fecha estimada para la entrega del pedido.
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs order_cost %}

Coste en euros de los productos del pedido (sin incluir envío ni promociones).

{% enddocs %}

{% docs order_total %}

Coste total en euros del pedido (incluyendo envío y promociones).

{% enddocs %}

{% docs shipping_cost %}

Coste en euros del servicio de envío.

{% enddocs %}

{% docs shipping_service %}

Nombre del servicio de envío.
Si el campo es 'null' significa que aún no se ha enviado el pedido, y por tanto,
no hay empresa de envío asignada.

{% enddocs %}

{% docs shipping_status %}

Estado actual del envío del pedido. Los posibles valores son:

  | shipping_status | definición                              |
  |---------------- |-----------------------------------------|
  | preparing       | El pedido se está preparando.           |
  | shipped         | El pedido ha sido enviado.              |
  | delivered       | El pedido ha sido entregado.            |

{% enddocs %}

{% docs tracking_id %}

Identificador único del seguimiento del pedido.
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs delivered_at_v2 %}

Marca temporal cuando el pedido fue entregado (zona horaria: UTC).
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs estimated_delivery_at_v2 %}

Fecha estimada para la entrega del pedido (zona horaria: UTC).
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs days_to_deliver %}

Días que quedan para que sea entregado el pedido.

{% enddocs %}