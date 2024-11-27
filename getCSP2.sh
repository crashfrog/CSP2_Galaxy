git clone --branch main --single-branch https://github.com/CFSAN-Biostatistics/CSP2.git
cd CSP2
git checkout v.0.9.7.1
cd ..
nextflow run CSP2/CSP2.nf -profile standard_conda --runmode conda_init
rm -rf ./.nextflow* ./.git* ./work ./getCSP2.sh ./README.md ./LICENSE
cd ..
mv CSP2_Galaxy csp2