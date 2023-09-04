## Conda

Using instructions from https://github.com/OBDS-Training/OBDS_Open_Workshop_Materials/blob/master/1_Conda/01_Mamba_intro_CCB.md

1. Log in to server
```
ssh -J clab0651@bastion.imm.ox.ac.uk clab0651@imm-obds
```

2. Installing mamba on home directory
```
mkdir mamba_installation
cd mamba_installation
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh -b -p conda
```

3. add to path
```
source /home/imm/clab0651/mamba_installation/conda/etc/profile.d/conda.sh
source /home/imm/clab0651/mamba_installation/conda/etc/profile.d/mamba.sh
mamba activate base
```

4. add alias in file ` ~/.bash_aliases`

```
alias load_mamba='source /home/imm/clab0651/mamba_installation/conda/etc/profile.d/conda.sh && source /home/imm/clab0651/mamba_installation/conda/etc/profile.d/mamba.sh && mamba activate base'

```

## Using mamba

```
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda
```

## Conda environments

Creating an environment
```
mamba create -n peaktools_env
mamba activate peaktools_env
```

## Rstudio
Need to download file `obds-connect-rstudio.sh`, which I have had to modify. The file reads

```
#!/bin/bash

CONFDIR=$HOME/.config/oxford-wimm-obds
CONFFILE=$CONFDIR/config.txt

if [ ! -d $CONFDIR ]; then
  mkdir $CONFDIR
fi

if [ ! -f $CONFFILE ]; then
  echo Configuring first time setup
  read -p "Please enter MSD-IT username: " MSD_USER
  echo MSD_USER=$MSD_USER > $CONFFILE
fi

MSD_USER=`grep MSD_USER $CONFFILE | cut -d '=' -f 2`

echo '***********************************'
echo '* Enter your password if prompted *'
echo '***********************************'
echo '* When connected, open webpage:   *'
echo '* http://localhost:8787           *'
echo '***********************************'

while :
do
  ssh -L 8787:localhost:8787 -o "ProxyJump=${MSD_USER}@bastion.imm.ox.ac.uk" "${MSD_USER}"@imm-obds
  echo WARN: Connection lost, retrying in 5 seconds
  sleep 5
done
```

Run this locally:

```
sh obds-connect-rstudio.sh
```
and open whichever browser with the url prompted.

