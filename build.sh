#!/bin/bash -ex

adhoc=""    
if [ "$1" == "adhoc" ]; then    
    adhoc="-Wl,-adhoc_codesign"    
fi    

mkdir -p build    

clang munkishim.m -o build/munkishim.x86_64 -framework Foundation -target x86_64-apple-macos11 "$adhoc"    
clang munkishim.m -o build/munkishim.arm -framework Foundation -target arm64-apple-macos11 "$adhoc"    
lipo -create -output build/munkishim build/munkishim.x86_64 build/munkishim.arm
