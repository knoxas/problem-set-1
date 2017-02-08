#! /usr/bin/env bash 

datasets="$HOME/data-sets"



# Question 1: Which state in states.tab.gz has the lowest murder rate?
states="$datasets/misc/states.tab.gz"

answer_1=$(zcat $states \
| cut -f1,6 \
| sort -k2n \
| grep -v '^#' \
| cut -f1 \
| head -n1 \
| sed 's/"//g')

echo "answer-1: $answer_1"

# Question 2: How many sequence records are in the sample.fa file?
sample="$datasets/fasta/sample.fa"

answer_2=$(grep '^>' $sample | wc -l)

echo "answer-2: $answer_2"

# Question 3: How many unique CpG IDs are in cpg.bed.gz?
IDs="$datasets/bed/cpg.bed.gz"

answer_3=$(zcat $IDs | cut -f4 | sort -k1n | uniq | wc -l)

echo "answer-3: $answer_3"

# Question 4: How many sequence records are in the SP1.fq file?
SP1="$datasets/fastq/SP1.fq"

answer_4=$(cat $SP1 | grep '^@cluster' | wc -l)

echo "answer-4: $answer_4"

# Question 5: How many words are on lines containing the word 'bloody' in hamlet.txt?
hamlet="$datasets/misc/hamlet.txt"

answer_5=$(grep "bloody" $hamlet | wc -w)

echo "answer-5: $answer_5"

#Question 6: What is the length of the sequence in the first record of sample.fa?

answer_6=$(grep -v '^>' $sample | head -n1 | wc -c)

echo "answer-6: $answer_6"

#Question 7: What is the name of the longest gene in genes.hg19.bed.gz?
genes="$datasets/bed/genes.hg19.bed.gz"

answer_7=$(zcat $genes | cut -f2,3,4 | awk 'BEGIN {OFS = "\t"}
{print $2 - $1, $3}' | sort -k1rn | cut -f2 | head -n1)

echo "answer-7: $answer_7"

#Question 8: How many unique chromosomes are in genes.hg19.bed.gz?

answer_8=$(zcat $genes | cut -f1 | uniq | wc -l)

echo "answer-8: $answer_8"

#Question 9: How many intervals are associated with CTCF (NOT CTCFL) in peaks.chr22.bed.gz?
peaks="$datasets/bed/peaks.chr22.bed.gz"

answer_9=$(zcat $peaks | grep -w "CTCF" | wc -l)

echo "answer-9: $answer_9"

#Question 10: On what chromosome is the largest interval in lamina.bed?
intervals="$datasets/bed/lamina.bed"

answer_10=$(awk 'BEGIN {OFS = "\t"} {print $1, $3 - $2}' $intervals | sort -k2rn | cut -f1 | head -n1)

echo "answer-10: $answer_10"


