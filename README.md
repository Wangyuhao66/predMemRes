# predMemRes
predMemRes: Predicting meropenem resistance phenotype based on the genome sequence of Klebsiella pneumoniae

Usage:
Help information:
./predMemRes.sh -h
Usage: predMemRes.sh -a genome -o output_tag
-a|--genome the input genome file
-o|output_tag the output_tag

Usage:
./predMemRes.sh -a genome.fasta -o output_tag

The program will generate two files as a result of running: 1) Output_tag_prediction.txt, which contains phenotype prediction information, resistance or sensitivity, and corresponding probabilities. 2) Output_tag__resistanceGenes.txt, this file contains information on the resistance genes and resistance related genes of the input genome.
