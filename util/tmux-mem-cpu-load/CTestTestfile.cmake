# CMake generated Testfile for 
# Source directory: /mnt/src/mine/profile/util/tmux-mem-cpu-load
# Build directory: /mnt/src/mine/profile/util/tmux-mem-cpu-load
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(usage "/mnt/src/mine/profile/util/tmux-mem-cpu-load/tmux-mem-cpu-load" "-h")
set_tests_properties(usage PROPERTIES  WILL_FAIL "TRUE")
add_test(no_arguments "/mnt/src/mine/profile/util/tmux-mem-cpu-load/tmux-mem-cpu-load")
add_test(colors "/mnt/src/mine/profile/util/tmux-mem-cpu-load/tmux-mem-cpu-load" "--colors")
add_test(arguments "/mnt/src/mine/profile/util/tmux-mem-cpu-load/tmux-mem-cpu-load" "--colors" "1" "4")
add_test(invalid_status_interval "/mnt/src/mine/profile/util/tmux-mem-cpu-load/tmux-mem-cpu-load" "-1" "4")
set_tests_properties(invalid_status_interval PROPERTIES  WILL_FAIL "TRUE")
add_test(invalid_graph_lines "/mnt/src/mine/profile/util/tmux-mem-cpu-load/tmux-mem-cpu-load" "1" "-4")
set_tests_properties(invalid_graph_lines PROPERTIES  WILL_FAIL "TRUE")
