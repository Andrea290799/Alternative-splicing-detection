for file in $1*MATS*;
do
name=$(echo $file | rev | cut -c5- | rev)

echo "ID	GeneID	geneSymbol	chr	strand	longExonStart_0base	longExonEnd	shortES	shortEE	flankingES	flankingEE	ID	IJC_SAMPLE_1	SJC_SAMPLE_1	IJC_SAMPLE_2	SJC_SAMPLE_2	IncFormLen	SkipFormLen	PValue	FDR	IncLevel1	IncLevel2	IncLevelDifference" > ${name}_filtered_FDR-counts.txt 

awk '{if ($20 <= 0.05) print}' $file > ${name}_filtered_FDR.txt

cat ${name}_filtered_FDR.txt | tr "," "\t"| awk '{if ($3+$6 > 10 || $4+$7 > 10 || $5+$8 > 10 || $9+$12 > 10 || $10+$13 > 10 || $11+$14 > 10) print $1}' > ${name}_ID_filtered_FDR-counts.txt
join ${name}_ID_filtered_FDR-counts.txt ${name}_filtered_FDR.txt | tr " " "\t"  >> ${name}_filtered_FDR-counts.txt 
rm ${name}_ID_filtered_FDR-counts.txt
done

