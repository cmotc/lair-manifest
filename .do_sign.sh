s=$(pwd)
for folder in $(find ./ -maxdepth 1 -type d); do
        cd $folder
        debsign --re-sign -k $KEY -e $GH_NAME $item
        cd $s
done
for item in $(ls *.deb); do debsigs --default-key $KEY $item; done
for item in $(ls *.tar.xz); do gpg --batch --yes --detach-sign -u $KEY $item; done
for item in $(ls *.tar.gz); do gpg --batch --yes --detach-sign -u $KEY $item; done
cd lair-msi
gpg --batch --yes --detach-sign -u $KEY lair-x86.msi
gpg --batch --yes --detach-sign -u $KEY lair-x64.msi
cd $s
