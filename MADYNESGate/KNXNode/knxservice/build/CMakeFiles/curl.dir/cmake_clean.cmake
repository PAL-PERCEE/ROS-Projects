FILE(REMOVE_RECURSE
  "../src/knxservice/srv"
  "../srv_gen"
  "../srv_gen"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/curl.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
