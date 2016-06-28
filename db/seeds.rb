# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Prioridades
# ===========

Prioridad.create(descripcion: 'Alta') #1
Prioridad.create(descripcion: 'Normal')#2
Prioridad.create(descripcion: 'Baja')#3
Prioridad.create(descripcion: 'S/N')#4


#novedad de medicion
#===============================================================
Novedad.create(codigo: 1, descripcion: "Medidor OK", prioridad_id: 4)
Novedad.create(codigo: 2, descripcion: "Medidor roto No Leido", prioridad_id: 3 )
Novedad.create(codigo: 3, descripcion: "Cortado sin medidor", prioridad_id: 1)
Novedad.create(codigo: 4, descripcion: "Cambio medidor", prioridad_id: 3)
Novedad.create(codigo: 5, descripcion: "R.O.B.O.(req.op.bajo.obs, prioridad_id: )", prioridad_id: 1)
Novedad.create(codigo: 6, descripcion: "Medidor sin tapa o rota", prioridad_id: 3)
Novedad.create(codigo: 7, descripcion: "Medidor sin acceso", prioridad_id: 2)
Novedad.create(codigo: 8, descripcion: "Medidor en cero", prioridad_id: 3)
Novedad.create(codigo: 9, descripcion: "Alto consumo", prioridad_id: 3)
Novedad.create(codigo: 10 ,descripcion: "Encontrado - Cambiar orden", prioridad_id: 3)
Novedad.create(codigo: 11 ,descripcion: "Corregir digitos", prioridad_id: 3)
Novedad.create(codigo: 12 ,descripcion: "Med.c/obstaculo superable", prioridad_id: 2)
Novedad.create(codigo: 13 ,descripcion: "Tapa medidor trabada", prioridad_id: 2)
Novedad.create(codigo: 14 ,descripcion: "Nro de medidor borroso", prioridad_id: 3)
Novedad.create(codigo: 15 ,descripcion: "Lectura c/dificultad", prioridad_id: 3)
Novedad.create(codigo: 16 ,descripcion: "Profundidad mayor a 30 cm", prioridad_id: 2)
Novedad.create(codigo: 17 ,descripcion: "Medidor empañado", prioridad_id: 3)
Novedad.create(codigo: 18 ,descripcion: "Camara inundada", prioridad_id: 2)
Novedad.create(codigo: 19 ,descripcion: "Perdidas en conexion", prioridad_id: 1)
Novedad.create(codigo: 20 ,descripcion: "Perdidas y Camara inundada", prioridad_id: 1 )
Novedad.create(codigo: 21 ,descripcion: "Medidor profundo e inund.", prioridad_id: 2)
Novedad.create(codigo: 22 ,descripcion: "Medidor profundo empañado", prioridad_id: 2)
Novedad.create(codigo: 23 ,descripcion: "Perdidas y med. empañado", prioridad_id: 2)
Novedad.create(codigo: 24 ,descripcion: "Instalacion Peligrosa", prioridad_id: 1)
Novedad.create(codigo: 25 ,descripcion: "Medidor trabado", prioridad_id: 2)
Novedad.create(codigo: 26 ,descripcion: "No medido p/fuerza mayor", prioridad_id: 2)
Novedad.create(codigo: 27 ,descripcion: "Conexion directa", prioridad_id: 1)
Novedad.create(codigo: 28 ,descripcion: "Medidor roto per leido", prioridad_id: 2)
Novedad.create(codigo: 29 ,descripcion: "Med.c/obstaculo insuperable", prioridad_id: 3)
Novedad.create(codigo: 30 ,descripcion: "Medidor sin camara", prioridad_id: 3)
Novedad.create(codigo: 31 ,descripcion: "Camara tapada con tierra", prioridad_id: 3)
Novedad.create(codigo: 32 ,descripcion: "Visor opaco legible c/dif.", prioridad_id: 3)
Novedad.create(codigo: 33 ,descripcion: "Visor opaco No legible", prioridad_id: 3)
Novedad.create(codigo: 34 ,descripcion: "Acceso Peligroso", prioridad_id: 1)
Novedad.create(codigo: 35 ,descripcion: "Acceso Dificil Med.Leido", prioridad_id: 2)
Novedad.create(codigo: 90 ,descripcion: "ACTIVIDAD NO RESIDENCIAL", prioridad_id: 3)
Novedad.create(codigo: 91 ,descripcion: "Usuario ­ NO LEIDO !", prioridad_id: 3)
Novedad.create(codigo: 92 ,descripcion: "TERRENO BALDIO", prioridad_id: 3)
Novedad.create(codigo: 98 ,descripcion: "SALIR", prioridad_id: 4)
Novedad.create(codigo: 99 ,descripcion: "PROXIMO MEDIDOR", prioridad_id: 4 )

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

# grupo de lectura
#================
Grupo.create(nombre: 'A',descripcion: 'MENSUAL',codigo: 9)
Grupo.create(nombre: 'B',descripcion: 'RAWSON',codigo: 0)
Grupo.create(nombre: 'C',descripcion: 'PLAYA, MAGAGNA Y CHACRAS', codigo: 1)

#zonas de medicion
#=================
Zona.create(nombre: "DON BOSCO",grupo_id: 2)
Zona.create(nombre: "RIVADAVIA",grupo_id:2)
Zona.create(nombre: "CARCEL",grupo_id:2)
Zona.create(nombre: "CENTRAL",grupo_id:2)
Zona.create(nombre: "SANDRA",grupo_id:2)
Zona.create(nombre: "BELGRANO",grupo_id:2)
Zona.create(nombre: "PELEGRINI",grupo_id:2)
Zona.create(nombre: "LEWIS JONES",grupo_id:2)
Zona.create(nombre: "Bo.RIO CHUBUT",grupo_id:2)
Zona.create(nombre: "Bo.MALVINAS",grupo_id:2)
Zona.create(nombre: "AREA 16",grupo_id:2)
Zona.create(nombre: "Bo.2 DE ABRIL 1",grupo_id:2)
Zona.create(nombre: "Bo.2 DE ABRIL 2",grupo_id:2)
Zona.create(nombre: "Bo.2 DE ABRIL 3",grupo_id:2)
Zona.create(nombre: "Bo.LUIS VERNET",grupo_id:2)
Zona.create(nombre: "VIALIDAD",grupo_id:2)
Zona.create(nombre: "Bo.50 VIVIENDAS",grupo_id:2)
Zona.create(nombre: "LA HERMITA",grupo_id:2)
Zona.create(nombre: "OVEON",grupo_id:2)
Zona.create(nombre: "Bo.SAN PABLO",grupo_id:2)
Zona.create(nombre: "PARQUE G.MAYO 1",grupo_id:2)
Zona.create(nombre: "PARQUE G.MAYO 2",grupo_id:2)
Zona.create(nombre: "Bo.U.P.C.N.",grupo_id:2)
Zona.create(nombre: "CHACRAS MENSUAL",grupo_id:2)
Zona.create(nombre: "PUERTO",grupo_id:2)
Zona.create(nombre: "PLAYA 1",grupo_id:2)
Zona.create(nombre: "PLAYA 2",grupo_id:2)
Zona.create(nombre: "PLAYA 3",grupo_id:2)
Zona.create(nombre: "PLAYA 4",grupo_id:2)
Zona.create(nombre: "CONS. CENTINELA",grupo_id:2)
Zona.create(nombre: "GRAND. USUARIOS",grupo_id:1)
Zona.create(nombre: "GRUPO A SIN MyG",grupo_id:1)
Zona.create(nombre: "TORRE TANQUE",grupo_id:2)
Zona.create(nombre: "Bo.S.E.R.O.S.",grupo_id:2)
Zona.create(nombre: "Bo.3 DE ABRIL",grupo_id:2)
Zona.create(nombre: "Bo.CO-VI-RA",grupo_id:2)
Zona.create(nombre: "Bo.DOCENTE",grupo_id:2)
Zona.create(nombre: "Bo.490 NORTE",grupo_id:2)
Zona.create(nombre: "Bo.490 SUR",grupo_id:2)
Zona.create(nombre: "PLAYA 5",grupo_id:2)
Zona.create(nombre: "Bo.MEDANOS",grupo_id:2)
Zona.create(nombre: "PLAYA MAGAGNA",grupo_id:2)
Zona.create(nombre: "Bo.COMERCIO",grupo_id:2)
Zona.create(nombre: "CHACRAS BIMENS.",grupo_id:2)
Zona.create(nombre: "AREA 18",grupo_id:2)