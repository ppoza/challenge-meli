# Buscador

Buscador es una pequeña app que permite buscar productos usando la API de Mercado Libre. 

| Buscardor | Resultado | Detalle Producto |
|----------|:-------------:|------|
| <img width="250" src="https://github.com/user-attachments/assets/dca4493c-88d6-47a7-99bc-48a09508d2e6"> |  <img width="250" src="https://github.com/user-attachments/assets/a3bad7ae-ea3d-43a6-97ac-49033f674522"> | <img width="250" src="https://github.com/user-attachments/assets/5d2ba881-b5cf-468c-b6f8-2d15d685d426">   |

# Arquitectura de la aplicación 

Para el desarrollo de la aplicación

Se uso Swift y SwiftUI. Teniendo en cuenta que SwiftUI es declarativo en función de un estado se elegió un Redux como patrón de arquitectura, el flujo es para actualizar un estado es unidireccinal y hay una source of thruth para en estado


```mermaid
graph TD;
    View--Action-->Store;
    Store--State-->View;    
```
