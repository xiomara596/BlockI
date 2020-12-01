#--------------------------------------------------------------
# Para limpiar el workspace, por si hubiera algun dataset 
# o informacion cargada
rm(list = ls())

#--------------------------------------------------------------
# Para limpiar el área de gráficos
dev.off()

#--------------------------------------------------------------
# Cambiar el directorio de trabajo
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

#--------------------------------------------------------------
# Limpiar la consola
cat("\014")


# Datos caracter
c1 <- "fuga"

c1
class(c1)

c2 <- "no fuga"

is.character(c1)


# Datos factor
f1 <- "Si"
f2 <- "No"
class(f1)

f1 <- as.factor(f1)
f2 <- factor(f2)

class(f1)
class(f2)

# Datos lógicos
d1 <- TRUE
d2 <- FALSE
d3 <- T

d1
d2
d3

!d1
d1 & d2
d1 | d2
is.logical(d2)
is.logical(f1)

#--------------------------------------------------------------
# 2.2 ESTRUCTURAS DE DATOS

#--------------------------------------------------------------
### Vectores ###

nombres <- c("Jose","Luisa","María","Marco")

class(nombres)
length(nombres)

dias <- c(15,20,60,75)
dias
class(dias)

# Operaciones con vectores
dias2 <- dias - 2 #SE ESTA RESTANDO A DIAS DOS 
dias2

# Posiciones en un Vector
# acceder al segundo elemento en el vector dias
dias[ARR2]
#PARA DETERMINAR LA POSICION EN EL QUE SE ENCUENTRA EL ELEMENTO QUE QUEREMOS 
# incluir los datos en el rango de 2 a 3 
dias[2:3]

# excluir el item 2 usando el signo menos
dias[-2]
#para que lo reconozca porque solo es en una dimension 
dias[c(1,2,4)]
#      Ejercicio   2     #
# Muestre todos los datos que están en la posición 1, 2 y 4

dias[-3]


# Los principales símbolos para comparar son >,>=,<,<=,==,!=
# Todos los elementos con dias > 30
dias[dias>30]

#      Ejercicio   3     #
# Calcule la siguiente expresión, asignelo al objeto
# formula y muestre su valor
# Muestre todos los elementos con dias = 20
dias[dias==20]


# Todos los elementos con dias > 20 y días <= 70
dias[dias > 18 & dias <=70 ]  
dias[dias > 18 | dias <=70 ] 
#ese simbolo es para decir que es O 

# Añadir el estado de mora como lógico
estado_mora <- c(FALSE, FALSE, TRUE, TRUE)
estado_mora
class(estado_mora)

estado_mora <- c(F, F, T, T)  # es similar
estado_mora
class(estado_mora)


#--------------------------------------------------------------
### Factores ###

# Añadir el factor genero
genero <- c("Masculino", "Femenino", "Femenino", "Masculino")
class(genero)

genero <- as.factor(genero)
class(genero)

is.factor(genero)

# Otra forma más directa
genero <- as.factor(c("Masculino","Femenino","Femenino","Masculino"))
class(genero)

genero <- c("Masculino","Femenino","Femenino","Masculino")
genero <-as.factor(c("Masculino","Femenino","Femenino","Masculino"))
class(genero)


# Añadir el nivel socio-economico
nivel <- factor(c("A","B","C","C"))
class(nivel)

# Añadir la fecha de nacimiento "Año-Mes-Día"
fecha.nac <- as.Date(c("1970-01-20","1980-03-10","1975-05-5","1990-08-29"))
class(fecha.nac)

# Aplicación de vectores en argumentos de funciones
table(genero)
plot(genero)
plot(genero, col= c("red","blue"))




#--------------------------------------------------------------
### Listas ###

# Mostrar información para un cliente
nombres[1]
dias[1]
estado_mora[1]
genero[1]
nivel[1]
fecha.nac[1]

# Crear una lista para un cliente
sujeto1 <- list( nombres[1], dias[1], estado_mora[1],
                 genero[1], nivel[1], fecha.nac[1])

# Crear una lista para un cliente con etiquetas
sujeto1 <- list( Nombre = nombres[1], 
                 Dias_de_impago = dias[1],
                 Estado_mora = estado_mora[1],
                 Genero = genero[1],
                 Nivel_Socio_Economico = nivel[1],
                 Fecha_Nacimiento =  fecha.nac[1])

# Mostrar un cliente
sujeto1
class(sujeto1)

is.list(sujeto1)

## Metodo para acceder a una lista

# Obtener un listado de valores por posición
sujeto1[1]

# Acceder a los valores 2 y 3
sujeto1[2:3]

#--------------------------------------------------------------
### Matrices ###

# Crear una matriz 2x2
m <- matrix(c(1,2,3,4,5,6), nrow = 2)
m

# Por defecto se ingresa la información por columnas
dim(m)
is.matrix(m)

# Equivalente a lo anterior
m <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 3)
m

# Ingreso por filas
m <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 3,byrow = TRUE)
m


# Extraer valores de una matriz
m[1, 1]
m[2, 3]

# Extraer filas
m[1, ]

# Extraer columnas
m[, 1]

# Mostrar todos los elementos
m[,]
m     # equivalente al anterior

#--------------------------------------------------------------
### Data frames ###

# Crear un data frame
df_data <- data.frame(nombres,dias,estado_mora,genero,
                      nivel,fecha.nac)

# Mostrando el data frame
df_data
is.data.frame(df_data)

dim(df_data)

# head() muestra los 6 primeros datos del dataframe
head(df_data)
head(df_data,2)

# tail() muestra los 6 últimos datos del dataframe
tail(df_data)
tail(df_data,2)

str(df_data)

## Accediendo a datos de un data frame
# Obtener una sola columna
df_data$nombres

# Cambiando el tipo de datos de factor a character
df_data$nombres <- as.character(df_data$nombres)
df_data$dias    <- as.integer(df_data$dias)

str(df_data)

# Accesando a una fila y una columna
df_data[1, 2]

#      Ejercicio   6     #
# Accediendo a las filas 1 y 3 y a las columnas 2 y 4


## Dejar una fila o columna en blanco para extraer todas las 
#  filas o columnas

# Columna 1, todas las filas 
df_data[,1]

# Fila 1, todas las columnas
df_data[1,]

# Todas las filas y todas las columnas
df_data[ , ]
df_data # Es similar


# Las siguientes sentencias son equivalentes
df_data[c(1, 3, 4), c(2,4)]
df_data[-2, c(2,4)]
df_data[-2, c(-1, -3, -5, -6)]
df_data[c(1, 3, 4), c("dias", "genero")]
df_data[-2, c("dias", "genero")]

# Condicionales
df_data[df_data$dias>30,]
df_data[dias>30,]             # Equivalente al anterior

df_data[dias>30]              # Será un error, por defecto
# asume todas las filas

df_data[nivel == "B",]

cond_1 <- df_data[df_data$dias>30,]
cond_1

# Equivalente usando subset(data.frame,condición)
cond_2 <- subset(df_data,dias>30)
cond_2


# Obtener varias columnas 
df_data[c("dias", "estado_mora")]
df_data[c(2,3)]
df_data[,2:3]      
df_data[2:3]    # Es similar, por defecto asume que son todas las filas

# Cambiando un dato
df_data[3,2]
df_data[3,2] <- 70
df_data[3,2]

# Otra forma de editar datos
fix(df_data)  

# Eliminar una columna de datos
df_data$mora2 <- NULL
str(df_data)
df_data <- df_data[,-7]  # No recomendable
str(df_data)

# Grabar los datos
str(df_data)
write.csv(df_data,"df_data.csv",row.names = F)
rm(list = ls())
datos1 <- read.csv("df_data.csv")

# Formato *.rds (un solo objeto)
saveRDS(datos1,"df_data.rds")

datos2 <- readRDS("df_data.rds")

# Formato *.RData (puedo guardar más de un objeto)
save(datos1,datos2,file = "df_data.RData")
rm(list = ls())

load("df_data.RData")
load("afinn.rda")
