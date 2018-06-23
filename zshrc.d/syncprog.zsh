function sync_stat() {
    watch grep -e Dirty: -e Writeback: /proc/meminfo
}
 
function sync_prog() {
    watch grep -e Dirty: -e Writeback: /proc/meminfo
}
