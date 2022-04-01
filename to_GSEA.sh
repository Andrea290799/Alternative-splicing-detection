rm $1*GSEA*
for file in $1*counts*;
do
    name=$(echo $file | rev | cut -c25- | rev )
    echo $name
    Rscript to_GSEA.R $file ${name}toGSEA.txt

    cat ${name}toGSEA.txt | tr " " "\t"  | cut -f2,3 > ${name}_toGSEA.txt
    rm ${name}toGSEA.txt
done