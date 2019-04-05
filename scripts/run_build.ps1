$parameterString = "--config=opt --config=cuda --define=no_tensorflow_py_deps=true --copt=-nvcc_options=disable-warnings //tensorflow:libtensorflow_cc.so --verbose_failures"
.\build.ps1 -BazelBuildParameters $parameterString -InstallDefaultDeps -BuildCppAPI
