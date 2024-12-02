{% docs orders_table %}

# Orders

Tabla de todos los pedidos existentes (todos los precios están 
expresados en euros).

{% enddocs %}

{% docs delivered_at %}

## Delivered At

Marca temporal cuando el pedido fue entregado.
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs estimated_delivery_at %}

## Estimated Delivery At

Fecha estimada para la entrega del pedido.
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs order_cost %}

## Order Cost

Coste en euros de los productos del pedido (sin incluir envío ni promociones).

{% enddocs %}

{% docs order_total %}

# Order Total

Coste total en euros del pedido (incluyendo envío y promociones).

{% enddocs %}

{% docs shipping_cost %}

# Shipping Cost

Coste en euros del servicio de envío.

{% enddocs %}

{% docs shipping_service %}

# Shipping Service

Nombre del servicio de envío.
Si el campo es 'null' significa que aún no se ha enviado el pedido, y por tanto,
no hay empresa de envío asignada.

{% enddocs %}

{% docs shipping_status %}

# Status

Estado actual del envío del pedido. Valores aceptados: preparing, delivered, shipped.

  | shipping_status | definición                              |
  |---------------- |-----------------------------------------|
  | preparing       | El pedido se está preparando.           |
  | shipped         | El pedido ha sido enviado.              |
  | delivered       | El pedido ha sido entregado.            |

{% enddocs %}

{% docs tracking_id %}

# Tracking ID

Identificador único del seguimiento del pedido.
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}


{% docs delivered_at_v2 %}

## Delivered At

Marca temporal cuando el pedido fue entregado (zona horaria: UTC).
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs estimated_delivery_at_v2 %}

## Estimated Delivery At

Fecha estimada para la entrega del pedido (zona horaria: UTC).
Si el campo es 'null' significa que aún no se ha enviado el pedido.

{% enddocs %}

{% docs days_to_deliver %}

## Days to deliver

Días que quedan para que sea entregado el pedido.

{% enddocs %}