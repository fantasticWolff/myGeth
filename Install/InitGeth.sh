#!/bin/bash
cd ../go-ethereum && make geth && sudo cp build/bin/geth /usr/local/bin/
echo ""
echo "geth --help"
echo ""
geth --help
