# create_base_script
Script used to create commands that run the base template on freesurfer (as part of the longitudinal pipeline).

Need to set working directory first
Input: Test_base.txt
The input must contain the patient number, and the MRI scan.
Make sure your patient number corresponds to base_(PatientNumber).

Output: Commands used for Freesurfer longitudinal pipeline to create individual base templates for each participant.
recon-all -base base_(PatientNumber) -tp MRI_scan1 -tp MRI_scan2 ... -tp MRI_scanX -all > base_(PatientNumber).txt

