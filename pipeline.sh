#!/bin/bash
# -*- ENCODING: UTF-8 -*-

# Se generan los índices del genoma (TUORIAL https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf, PUNTO 2)
#STAR --runThreadN 40 --runMode genomeGenerate --genomeDir Indexes --genomeFastaFiles Datos/hg38.fa --sjdbGTFfile Datos/hg38.refGene.gtf --sjdbOverhang 149

# Después de descargar el software de rMATS... (TUTORIAL https://github.com/Xinglab/rmats-turbo/blob/v4.1.2/README.md)
#./rmats_turbo_v4_1_2/build_rmats --conda

# Análisis C vc ICS
./rmats_turbo_v4_1_2/run_rmats --s1 control.txt --s2 mild.txt --gtf Datos/hg38.refGene.gtf --bi Indexes/ -t paired --readLength 70 --variable-read-length --nthread 40 --novelSS --od od_dir_C_ICS --tmp tmp_dir_C_ICS

# Análisis C vs UC
./rmats_turbo_v4_1_2/run_rmats --s1 control.txt --s2 severe.txt --gtf Datos/hg38.refGene.gtf --bi Indexes/ -t paired --readLength 70 --variable-read-length --nthread 40 --novelSS --od od_dir_C_UC --tmp tmp_dir_C_UC

# Análisis ICS vs UC
./rmats_turbo_v4_1_2/run_rmats --s1 mild.txt --s2 severe.txt --gtf Datos/hg38.refGene.gtf --bi Indexes/ -t paired --readLength 70 --variable-read-length --nthread 40 --novelSS --od od_dir_ICS_UC --tmp tmp_dir_ICS_UC

# Descargar rmats2sashimiplot (TUTORIAL https://github.com/Xinglab/rmats2sashimiplot)
# Plots por grupos C vs ICS
python2 ./rmats2sashimiplot/src/rmats2sashimiplot/rmats2sashimiplot.py -o sashimiplots_C_ICS --b1 ./datos_para_sashimiplot/2022-03-28-11_16_25_013585_bam1_1/Aligned.sortedByCoord.out.bam,./datos_para_sashimiplot/2022-03-28-11_16_25_013585_bam1_2/Aligned.sortedByCoord.out.bam,./datos_para_sashimiplot/2022-03-28-11_16_25_013585_bam1_3/Aligned.sortedByCoord.out.bam --b2 ./datos_para_sashimiplot/2022-03-28-11_16_25_013585_bam2_1/Aligned.sortedByCoord.out.bam,./datos_para_sashimiplot/2022-03-28-11_16_25_013585_bam2_2/Aligned.sortedByCoord.out.bam,./datos_para_sashimiplot/2022-03-28-11_16_25_013585_bam2_3/Aligned.sortedByCoord.out.bam -t SE -e ./datos_para_sashimiplot/SE.MATS.JC.txt --l1 SampleOne --l2 SampleTwo --group-info grouping.gf


