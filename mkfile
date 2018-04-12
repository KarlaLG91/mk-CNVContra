# Para cargar las configuraciones de un config.mk usamos la siguiente linea
# esta linea busca al config.mk en el mismo directorio donde esta el mkfile
< config.mk

# un ejemplo que no usaremos hoy, es cargarun config.mk de otro directorio
#< ../otro_directorio/config.mk

## Un ejemplo de lo que sucede con las variables cargadas por config.mk
ver_variables_de_config:V: $TARGET_BED
	echo "[DEBUGGING] Si existe el archivo BED en $P0667prereq"
#	echo "Y contiene la variable $TARGET_BED"

### qui empieza el script propiamente

## Ejecutar contra, donde el target es el directorio de salida
## Dentro del bloque de código, el la variable % del header, se manda a llamar como "$stem"
results/%N_GATKrealigned_duplicates_marked: data/%T_GATKrealigned_duplicates_marked.bam
	mkdir -p `dirname $target`
	python bin/contra.py \
	--target $TARGET_BED \
	--test $prereq \
	--control data/$stem"N_GATKrealigned_duplicates_marked.bam" \
	--outFolder $target.build \
	&& mv $target.build $target
