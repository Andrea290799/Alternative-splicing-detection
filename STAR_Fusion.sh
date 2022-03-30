#!/bin/bash
# -*- ENCODING: UTF-8 -*-

file_names=( )

for file in Datos_clean/*
do
name=$(echo $file | rev | cut -c14- | rev)

file_names+=(${name})

done

uniqs_arr=($(for ip in "${file_names[@]}"; do echo "${ip}"; done | sort -u))


for name in ${uniqs_arr[@]}
do
    samples=()
    file=*$name* 
    for i in $file 
    do
    samples+=($i)
    done

    sample=$(echo $name | cut -c13-)
    echo $sample

    $(STAR-Fusion --genome_lib_dir ./Datos \
             --left_fq ${samples[0]} \
             --right_fq ${samples[1]} \
             --output_dir ${name}_star_fusion_outdir)

done
