FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/PALGATE_msgs/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/PALGATE_msgs/msg/__init__.py"
  "../src/PALGATE_msgs/msg/_ZigbeeFrame.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
