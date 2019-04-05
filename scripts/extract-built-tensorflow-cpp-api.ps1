# This script should be executed outside repo folder of https://github.com/guikarist/tensorflow-windows-build-script.
Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"

Remove-Item bin -ErrorAction SilentlyContinue -Force -Recurse

$tensorFlowBinDir = "$pwd\bin"
mkdir $tensorFlowBinDir | Out-Null

$tensorFlowSourceDir = "$pwd\tensorflow-windows-build-script\source"
$tensorFlowBuildDir = "$pwd\tensorflow-windows-build-script"

# Tensorflow lib and includes
mkdir "$tensorFlowBinDir/tensorflow/lib" | Out-Null
Copy-Item  $tensorFlowSourceDir\bazel-bin\tensorflow\libtensorflow_cc.so $tensorFlowBinDir\tensorflow\lib\tensorflow_cc.dll
Copy-Item  $tensorFlowSourceDir\bazel-bin\tensorflow\liblibtensorflow_cc.so.ifso $tensorFlowBinDir\tensorflow\lib\tensorflow_cc.lib
Copy-Item  $tensorFlowSourceDir\bazel-bin\tensorflow\liblibtensorflow_cc.so.exp $tensorFlowBinDir\tensorflow\lib\tensorflow_cc.exp

Copy-Item $tensorFlowSourceDir\tensorflow\core $tensorFlowBinDir\tensorflow\include\tensorflow\core -Recurse -Container  -Filter "*.h"
Copy-Item $tensorFlowSourceDir\tensorflow\cc $tensorFlowBinDir\tensorflow\include\tensorflow\cc -Recurse -Container -Filter "*.h"

Copy-Item $tensorFlowSourceDir\bazel-genfiles\tensorflow\core\ $tensorFlowBinDir\tensorflow\include_pb\tensorflow\core -Recurse -Container -Filter "*.h"
Copy-Item $tensorFlowSourceDir\bazel-genfiles\tensorflow\cc $tensorFlowBinDir\tensorflow\include_pb\tensorflow\cc -Recurse -Container -Filter "*.h"

# Protobuf lib, bin and includes.
# Get-ChildItem $tensorFlowBuildDir\deps\protobuf\bin -Directory | Copy-Item -Destination $tensorFlowBinDir\protobuf -Recurse -Container
# mkdir $tensorFlowBinDir\protobuf\bin\ -ErrorAction SilentlyContinue
# Move-Item $tensorFlowBinDir\protobuf\protoc.exe $tensorFlowBinDir\protobuf\bin\protoc.exe -ErrorAction SilentlyContinue

# Absl includes.
Copy-Item $tensorFlowSourceDir\bazel-source\external\com_google_absl\absl $tensorFlowBinDir\absl\include\absl\ -Recurse -Container -Filter "*.h" 
Copy-Item $tensorFlowSourceDir\bazel-source\external\com_google_absl\absl\numeric\*.inc $tensorFlowBinDir\absl\include\absl\numeric

# Eigen includes
Copy-Item $tensorFlowSourceDir\bazel-source\external\eigen_archive\ $tensorFlowBinDir\Eigen\eigen_archive -Recurse
Copy-Item $tensorFlowSourceDir\third_party\eigen3 $tensorFlowBinDir\Eigen\include\third_party\eigen3\ -Recurse
