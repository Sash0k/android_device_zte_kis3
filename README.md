LineageOS 14.1 device configuration for [ZTE Open C / Kis 3](https://hackurx.wordpress.com/2018/11/20/lineageos-14-1-pour-le-zte-open-c-kis-3/).

How to build:
-------------

Create a clean folder and work in it:

    mkdir ~/lineageos
    cd ~/lineageos


Initialize repo:

    repo init -u git://github.com/LineageOS/android.git -b cm-14.1
    curl --create-dirs -L -o .repo/local_manifests/manifest_zte_kis3.xml -O -L https://raw.githubusercontent.com/Sash0k/android_local_manifest/master/manifest_zte_kis3.xml
    repo sync -j4

Compile:

    . build/envsetup.sh
    brunch kis3
    
How to add modifications :
--------------------------

Add the changes that are not my git :

    cd ~/LineageOS
    patch -Np1 --no-backup-if-mismatch < device/zte/kis3/Add_my_modifications_without_fork.patch

Edit your files and save your changes :

    repo diff > your_modification.patch
