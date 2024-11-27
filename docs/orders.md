{% docs orders_table %}

# Orders

Tabla de todos los pedidos existentes.

{% enddocs %}

{% docs delivered_at %}

## Delivered At

Marca temporal cuando el pedido fue entregado.

{% enddocs %}

{% docs estimated_delivery_at %}

## Estimated Delivery At

Fecha estimada para la entrega del pedido.

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

{% enddocs %}

{% docs shipping_status %}

# Status

Estado actual del envío del pedido. Valores aceptados: preparing, delivered, shipped.

  | status         | definición                              |
  |----------------|-----------------------------------------|
  | preparing      | El pedido se está preparando.           |
  | shipped        | El pedido ha sido enviado.              |
  | delivered      | El pedido ha sido entregado.            |

{% enddocs %}

{% docs tracking_id %}

# Tracking ID

Identificador único del seguimiento del pedido.

{% enddocs %}