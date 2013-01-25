FILE(REMOVE_RECURSE
  "../src/GATE_ZigBee/msg"
  "../msg_gen"
  "../msg_gen"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/GATE_ZigBee/msg/__init__.py"
  "../src/GATE_ZigBee/msg/_ZigbeeFrame.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
