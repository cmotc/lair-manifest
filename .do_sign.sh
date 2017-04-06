s=$(pwd)
for folder in $(find ./ -maxdepth 1 -type d); do
        cd $folder
        debsign -k $KEY -e $GH_NAME $item
        cd $s
done
for item in $(ls *.deb); do debsigs --re-sign --default-key $KEY $item; done
for item in $(ls *.tar.xz); do gpg --batch --yes --detach-sign -u $KEY $item; done
for item in $(ls *.tar.gz); do gpg --batch --yes --detach-sign -u $KEY $item; done
