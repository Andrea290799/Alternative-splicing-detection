
for bam in $1*bam*
do
bams+=($bam)
done



for file in $1*counts*;
do
name=$(echo $file | rev | cut -c21- | rev)

python2 ./rmats2sashimiplot/src/rmats2sashimiplot/rmats2sashimiplot.py -o ${name}_sashimiplots --b1 ${bams[0]}/Aligned.sortedByCoord.out.bam,${bams[1]}/Aligned.sortedByCoord.out.bam,${bams[2]}/Aligned.sortedByCoord.out.bam --b2 ${bams[3]}/Aligned.sortedByCoord.out.bam,${bams[4]}/Aligned.sortedByCoord.out.bam,${bams[5]}/Aligned.sortedByCoord.out.bam -t SE -e $file --l1 SampleOne --l2 SampleTwo --group-info grouping.gf

done






