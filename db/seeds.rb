# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Prioridades
# ===========

Prioridad.create(descripcion: 'Alta')
Prioridad.create(descripcion: 'Normal')
Prioridad.create(descripcion: 'Baja')

# Tipos de medidores
# ===================



# Estado 
# ===================

Estado.create(descripcion: 'Alta')
Estado.create(descripcion: 'Baja')

# Tipo de documento
# ===================

TipoDocumento.create(descripcion: 'CUIT')
TipoDocumento.create(descripcion: 'LE')
TipoDocumento.create(descripcion: 'LC')
TipoDocumento.create(descripcion: 'DNI')
TipoDocumento.create(descripcion: 'CI')