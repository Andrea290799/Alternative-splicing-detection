#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Se generan los índices del genoma (TUORIAL https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf, PUNTO 2)
#STAR --runThreadN 40 --runMode genomeGenerate --genomeDir Indexes --genomeFastaFiles Datos/hg38.fa --sjdbGTFfile Datos/hg38.refGene.gtf --sjdbOverhang 149

# Descargar el software de rMATS (TUTORIAL https://github.com/Xinglab/rmats-turbo/blob/v4.1.2/README.md)
#./rmats_turbo_v4_1_2/build_rmats --conda

# Análisis C vc ICS
#./rmats_turbo_v4_1_2/run_rmats --s1 control.txt --s2 mild.txt --gtf Datos/hg38.refGene.gtf --bi Indexes/ -t paired --readLength 70 --variable-read-length --nthread 40 --novelSS --od od_dir_C_ICS --tmp tmp_dir_C_ICS

# Análisis C vs UC
#./rmats_turbo_v4_1_2/run_rmats --s1 control.txt --s2 severe.txt --gtf Datos/hg38.refGene.gtf --bi Indexes/ -t paired --readLength 70 --variable-read-length --nthread 40 --novelSS --od od_dir_C_UC --tmp tmp_dir_C_UC

# Análisis ICS vs UC
#./rmats_turbo_v4_1_2/run_rmats --s1 mild.txt --s2 severe.txt --gtf Datos/hg38.refGene.gtf --bi Indexes/ -t paired --readLength 70 --variable-read-length --nthread 40 --novelSS --od od_dir_ICS_UC --tmp tmp_dir_ICS_UC

# Se filtran los resultados de cada comparativa
#./filter.sh od_dir_C_ICS/
#./filter.sh od_dir_C_UC/
#./filter.sh od_dir_ICS_UC/

# Descargar rmats2sashimiplot (TUTORIAL https://github.com/Xinglab/rmats2sashimiplot)
# Plots por grupos de cada comparativa
./sashimiplots.sh to_sashimi_C_ICS/ C_ICS
./sashimiplots.sh to_sashimi_C_UC/ C_UC
./sashimiplots.sh to_sashimi_ICS_UC/ ICS_UC

