

for file in $1*MATS*;
do
name=$(echo $file | rev | cut -c5- | rev)

echo "ID	GeneID	geneSymbol	chr	strand	longExonStart_0base	longExonEnd	shortES	shortEE	flankingES	flankingEE	ID	IJC_SAMPLE_1	SJC_SAMPLE_1	IJC_SAMPLE_2	SJC_SAMPLE_2	IncFormLen	SkipFormLen	PValue	FDR	IncLevel1	IncLevel2	IncLevelDifference" > filtered/${name}_filtered_FDR-IncLvl.txt 

awk '{if ($20 <= 0.05) print}' $file | sort -k1,1 > filtered/${name}_filtered_FDR.txt

cat filtered/${name}_filtered_FDR.txt | tr "," "\t"| awk '{if ($29 > 0.1 || $30 > 0.1 || $31 > 0.1 || $32 > 0.1 || $33 > 0.1 || $34 > 0.1) print $1}' | sort -k1,1 > filtered/${name}_ID_filtered_FDR-IncLvl.txt
join filtered/${name}_ID_filtered_FDR-IncLvl.txt filtered/${name}_filtered_FDR.txt | tr " " "\t"  >> filtered/${name}_filtered_FDR-IncLvl.txt 
rm filtered/${name}_ID_filtered_FDR-IncLvl.txt
done

