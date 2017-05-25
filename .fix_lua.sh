
for item in $(ls /usr/include/lua5.1/); do
        sudo ln -v -f -s /usr/include/lua5.1/$item /usr/include/$item;
done

#for item in $(ls /usr/include/lua5.2/); do
#        sudo ln -s /usr/include/lua5.2/$item /usr/include/$item;
#done

#for item in $(ls /usr/include/lua5.3/); do
#        sudo ln -s /usr/include/lua5.3/$item /usr/include/$item;
#done

