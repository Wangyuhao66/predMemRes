<center>
# predMemRes: Predicting meropenem resistance phenotype based on the genome sequence of Klebsiella pneumoniae
</center>

---

## Usage
**Help information**:  
```bash
./predMemRes.sh -h
```

**Basic command**:  
```bash
predMemRes.sh -a genome -o output_tag
```

### Parameters
| Parameter           | Description                          |
|---------------------|--------------------------------------|
| `-a` / `--genome`   | The input genome file (FASTA format) |
| `-o` / `--output_tag` | Prefix for output files             |

---

## Example
```bash
./predMemRes.sh -a genome.fasta -o output_tag
```


## Output Files
1. **Prediction Result**: `output_tag_prediction.txt`  
   - Contains phenotype prediction (`Resistance`/`Sensitivity`) and corresponding probabilities.

2. **Resistance Gene Report**: `output_tag__resistanceGenes.txt`  
   - Lists detected resistance genes and related mechanisms (e.g., carbapenemase genes, porin mutations).

