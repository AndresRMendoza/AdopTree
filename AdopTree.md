<div align="center">

# AdopTree.

</div>

## Entidades.

### personas (entidad de datos).

- persona_id INT AUTO **PK**
- nombre VARCHAR(50)
- apellido_paterno VARCHAR(50)
- apellido_materno VARCHAR(50)
- fecha_nacimiento DATETIME
- curp VARCHAR(18) **(UQ)**
- email VARCHAR(100) **(UQ)**
- clave VARCHAR(50)
- direccion INT **FK**
- escuela INT **FK**

### direcciones (entidad de datos).

- direccion_id INT AUTO **PK**
- codigo_postal INT
- numero INT
- calle VARCHAR(50)
- colonia VARCHAR(50)
- ciudad VARCHAR(50) 
- estado INT **FK**

### estados (entidad catálogo).

- estado_id INT AUTO **PK**
- estado VARCHAR(50)

### escuelas (entidad de datos).

- escuela_id INT AUTO **PK**
- direccion INT **FK**
- nombre VARCHAR(100)

### arboles (entidad de datos).

- arbol_id INT AUTO **PK**
- direccion INT **FK**
- especie INT **FK**
- altura FLOAT
- inclinacion FLOAT
- perimetro FLOAT
- indice_supervivencia FLOAT
- disponible BOOLEAN

### direcciones_arboles (entidad de datos).

- direccion_arbol_id INT AUTO **PK**
- codigo_postal INT
- calle VARCHAR(50)
- colonia VARCHAR(50)
- ciudad VARCHAR(50) 
- estado INT **FK**

### especies (entidad de datos).

- especie_id INT AUTO **PK**
- nombre VARCHAR(50)
- nombre_cientifico VARCHAR(100)
- oxigeno FLOAT
- dioxido_carbono FLOAT
- especie_endemica BOOLEAN
- frecuencia_riego FLOAT

### servicios_arboles (entidad de datos).

- servicio_arbol_id INT AUTO **PK**
- foto VARCHAR(255)
- fecha DATETIME
- observacion VARCHAR(255)
- vivo BOOLEAN
- servicio INT **FK**
- arbol INT **FK**

### tipos_servicios (entidad catálogo). 

- servicio_id INT AUTO **PK**
- servicio VARCHAR(50)

### adopciones (entidad pivote).

- adopcion_id INT AUTO **PK**
- persona INT **FK**
- arbol INT **FK**
- fecha DATETIME

## Relaciones.

1. Una persona puede tener una dirección (1:1).
1. Una escuela puede tener muchas personas (1:M).
1. Una dirección puede tener un estado (1:1).
1. Una escuela puede tener una dirección (1:1).
1. Un árbol puede tener una dirección (1:1).
1. Un árbol puede tener una especie (1:1).
1. La dirección de un árbol puede tener un estado (1:1).
1. Un árbol puede tener varios servicios (1:M).
1. Una persona solo puede hacer una adopción (1:1).
1. Un árbol solo puede ser adoptado por una persona (1:1).
1. Un árbol puede tener varios servicios (1:M)

## Diagrama entidad relación.

![Diagrama entidad relación.](./AdopTree.jpg)


