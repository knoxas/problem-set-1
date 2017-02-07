#! /usr/bin/env bash 

datasets='/Users/jayhesselberth/devel/MOLB7621/data-sets'
# Which state has the highest popultion?

states="$datasets/states.tab.gz"

answer_0=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,2 \
    | sort -k2n \
    | tail -n1 \
    | cut -f1 \
    | sed 's/"//g') 

echo "answer-1: $answer_1"

answer_2=$
