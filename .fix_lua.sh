
if [ "$1" == "1" ]; then
        for item in $(ls /usr/include/lua5.1/); do
                sudo ln -v -f -s /usr/include/lua5.1/$item /usr/include/$item;
                sudo ln -v -f -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.1.pc /usr/lib/pkgconfig/lua.pc
                sudo ln -v -f -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.1.pc /usr/lib/x86_64-linux-gnu/pkgconfig/lua.pc
        done
elif [ "$1" == "2" ]; then
        for item in $(ls /usr/include/lua5.2/); do
                sudo ln -v -f -s /usr/include/lua5.2/$item /usr/include/$item;
                sudo ln -v -f -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.2.pc /usr/lib/pkgconfig/lua.pc
                sudo ln -v -f -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.2.pc /usr/lib/x86_64-linux-gnu/pkgconfig/lua.pc
        done
elif [ "$1" == "3" ]; then
        for item in $(ls /usr/include/lua5.3/); do
                sudo ln -v -f -s /usr/include/lua5.3/$item /usr/include/$item;
                sudo ln -v -f -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.3.pc /usr/lib/pkgconfig/lua.pc
                sudo ln -v -f -s /usr/lib/x86_64-linux-gnu/pkgconfig/lua5.3.pc /usr/lib/x86_64-linux-gnu/pkgconfig/lua.pc
        done
elif [ "$1" == "jit" ]; then
        for item in $(ls /usr/include/luajit-2.0/); do
                sudo ln -v -f -s /usr/include/luajit-2.0/$item /usr/include/$item;
                sudo ln -v -f -s /usr/lib/x86_64-linux-gnu/pkgconfig/luajit.pc /usr/lib/pkgconfig/lua.pc
                sudo ln -v -f -s /usr/lib/x86_64-linux-gnu/pkgconfig/luajit.pc /usr/lib/x86_64-linux-gnu/pkgconfig/lua.pc
        done
elif [ "$1" == "clean" ]; then
        rm '/usr/include//lauxlib.h' \
        '/usr/include/lua-bitop.h' \
        '/usr/include/luaconf.h' \
        '/usr/include/lua.h' \
        '/usr/include/lua.hpp' \
        '/usr/include/lualib.h' \
        '/usr/include/lua-rrd.h'
fi
