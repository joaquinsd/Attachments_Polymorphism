# Desafío Catalogo Parte II
## Definir los Modelos
Lo primero que debemos hacer es crear nuestro proyecto
```bash
rails new polymorphism --database=postgresql
```
Luego debemos crear nuestros modelos en base a los atributos que tengan nuestros animales, en este caso sólo definiremos un nombre y una especie (gato, perro, águila, vaca, caballo, etc.)

```bash
rails g model Animal name species:references{polymorphic}
rails g model Dog
rails g model Cat
rails g model Eagle
rails g model Cow
rails g model Horse
rails db:migrate
```

Así definimnos que existe una relación entre `Animal` y `SPecies`, a través de la instrucción `references{polymorphic}`, lo que se refleja en las 2 columnas `species_id` y `species_type`

Luego en nuestro modelo de Animal, veríamos lo siguiente:

```ruby
class Animal < ApplicationRecord
  belongs_to :species, polymorphic: true
end
```
Mientras que en nuestros modelos de Dog, Cat, Eagle, etc., debemos declarar que son alternativas de `species`

```ruby
class Dog < ApplicationRecord
  has_many :animals, as: :species
end
#------------------------------------
class Cat < ApplicationRecord
  has_many :animals, as: :species
end
#------------------------------------
class Eagle < ApplicationRecord
  has_many :animals, as: :species
end
# etc.
```

## Crear los Registros
Ahora, para crear el regsitro de nuestro animal podemos entrar a la consola y ejecutar el siguiente comando
```bash
2.6.6 :001 > Animal.create(name: 'Scooby', species: Dog.new)
   (0.1ms)  begin transaction
  Dog Create (0.5ms)  INSERT INTO "dogs" ("created_at", "updated_at") VALUES (?, ?)  [["created_at", "2021-06-20 17:24:56.337321"], ["updated_at", "2021-06-20 17:24:56.337321"]]
  Animal Create (0.2ms)  INSERT INTO "animals" ("name", "species_type", "species_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "Scooby"], ["species_type", "Dog"], ["species_id", 1], ["created_at", "2021-06-20 17:24:56.341040"], ["updated_at", "2021-06-20 17:24:56.341040"]]
   (6.0ms)  commit transaction
 => #<Animal id: 1, name: "Scooby", species_type: "Dog", species_id: 1, created_at: "2021-06-20 17:24:56", updated_at: "2021-06-20 17:24:56">
```
Lo que nos retorna la consola nos muestra que en el campo species_type le puso el nombre del modelo Dog, y en species_id, el id de la tabla Dog, que corresponde al registro que acabamos de crear.
