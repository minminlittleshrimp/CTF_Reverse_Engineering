# Notice

### To stop the dlt_segment throwing:
```
cmake .. -DWITH_DLT_NETWORK_TRACE=OFF
sudo make install -j16
```
### To bypass the SIG32 (we ignore):
```
(gdb) handle SIG32 nostop noprint
```

### Happy reversing! :smirk: