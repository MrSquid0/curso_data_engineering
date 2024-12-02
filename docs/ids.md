{% docs order_id %}

Identificador único del pedido asociado.
Si el valor está vacío significa que no hay ningún pedido asociado, 
es decir, que no se ha efectuado ninguna compra.

{% enddocs %}

{% docs order_id_v2 %}

Identificador único del pedido asociado.
Si el valor es 'null' significa que no hay ningún pedido asociado, 
es decir, que no se ha efectuado ninguna compra.

{% enddocs %}

{% docs promo_id %}

Identificador único de la promoción.
Si el campo está vacío significa que no hay ninguna promoción aplicada.

{% enddocs %}

{% docs address_id %}

Identificador único de la dirección del usuario.

{% enddocs %}

{% docs event_id %}

Identificador único del evento.

{% enddocs %}

{% docs product_id %}

Identificador único del producto asociado.
Si el valor está vacío significa que no hay ningún producto asociado.

{% enddocs %}

{% docs product_id_v2 %}

Identificador único del producto asociado.
Si el valor es 'null' significa que no hay ningún producto asociado.

{% enddocs %}

{% docs order_items_id %}

Identificador único de la cantidad del producto en el pedido creado 
a través de una 'surrogate key' con los valores 'order_id' y 'product_id'.

{% enddocs %}

{% docs budget_id %}

Identificador único del presupuesto creado a través de una 'surrogate key' 
con los valores 'product_id' y 'month'.

{% enddocs %}

{% docs promo_id_v2 %}

Identificador único de la promoción creado a través de una 'surrogate key' 
con el valor 'promo_id'.
Si el valor es 'null' significa que no hay ninguna promoción aplicada.

{% enddocs %}