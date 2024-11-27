# users

## Descripción
Este conjunto de datos contiene información sobre los usuarios registrados en el sistema, como direcciones, correos electrónicos y pedidos realizados.

### Fuente de datos
**Base de datos:** `{{ env_var('DBT_ENVIRONMENTS') }}_BRONZE_DB`  
**Esquema:** `sql_server_dbo`  

### Configuración de Freshness
- **Advertencia:** Después de 15 días.  
- **Error:** Después de 20 días.

---

## Columnas

### `address_id`
**Descripción:**  
Identificador único de la dirección del usuario.  
**Pruebas:**  
- No nulo (`not_null`)

### `created_at`
**Descripción:**  
Marca de tiempo de creación del usuario.  
**Pruebas:**  
- No nulo (`not_null`)

### `email`
**Descripción:**  
Correo electrónico del usuario.  
**Pruebas:**  
- No nulo (`not_null`)  
- Único (`unique`)

### `first_name`
**Descripción:**  
Primer nombre del usuario.  
**Pruebas:**  
- No nulo (`not_null`)

### `last_name`
**Descripción:**  
Apellido del usuario.  
**Pruebas:**  
- No nulo (`not_null`)

### `phone_number`
**Descripción:**  
Número de teléfono del usuario.  
**Pruebas:**  
- No nulo (`not_null`)  
- Único (`unique`)

### `total_orders`
**Descripción:**  
Cantidad total de pedidos realizados por el usuario.

### `updated_at`
**Descripción:**  
Última actualización de cualquier campo del usuario.  
**Pruebas:**  
- No nulo (`not_null`)

### `user_id`
**Descripción:**  
Identificador único del usuario.  
**Pruebas:**  
- No nulo (`not_null`)  
- Único (`unique`)

### `_fivetran_deleted`
**Descripción:**  
Indicador de eliminación en Fivetran.

### `_fivetran_synced`
**Descripción:**  
Fecha de sincronización desde Fivetran.  
**Pruebas:**  
- No nulo (`not_null`)
