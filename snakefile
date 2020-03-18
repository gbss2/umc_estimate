======================================================================
# Bio Bureau Project
#=====================================================================
#
# (/u0254) Copyleft 2020, by Bio Bureau and Contributors.
#
# -----------------
# Unique molecular coverage estimate for PacBio sequencing <UMC estimate>
# -----------------
# GNU GPL 2020, by Bio Bureau and Contributors.
#
# ORIGINAL AUTHOR: Giordano Bruno Soares-Souza
# SOURCES AND/OR CONTRIBUTOR(S): 
# 	DEVOPS - 
# 	GALAXY - 
#
# UPDATED BY: Giordano Bruno Soares-Souza
#
# COMMAND LINE: ./snakemake
#
# DEPENDENCIES: <PLEASE REFER TO CODE>
# DESCRIPTION: Estimate the unique molecular coverage for CLR/PacBio sequencing
# 
# INPUTS: BAM FILES (PACBIO)
# FUTURE DEVELOPMENTS: 
# 1) 
################################################################################

configfile: "config.yaml"

rule convert2fasta
	input:
		bam=expand("{sample}.bam", sample=config["samples"]),
	output:
		fasta="{sample}.fasta"
	threads:
	shell:
		" bamtools convert -format fasta {input} {output} "

		
rule subread_median_length
	input:
		"{sample}.fasta"
	output:
		"{sample}.median"
	threads:
	shell:
		" python -m falcon_kit.mains.fasta_filter median {input} > {output} "
		

rule index_files
	input:
		"{sample}.median"
	output:
		"{sample}.median.fai"
	threads:
	shell:
		" samtools faidx {input} "

rule sum_lengths
	input:
		
		
	output:
		
	threads:
	shell:
		" cut -f2 {input} | datamash sum 1 > {output} "

rule sum_all_lengths
	input:
		
		
	output:
		
	threads:
	shell:
		

