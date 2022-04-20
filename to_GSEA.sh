rm $1*GSEA*
for file in $1*IncLvl*;
do
    name=$(echo $file | rev | cut -c25- | rev )
    echo $name
    Rscript GSEA.R $file ${name}toGSEA.txt

    cat ${name}toGSEA.txt | tr " " "\t" | cut -f2,3 | tr -d '"' | tr -s " " "\t" | tail -n +2  > ${name}_toGSEA.rnk
    rm ${name}toGSEA.txt
done