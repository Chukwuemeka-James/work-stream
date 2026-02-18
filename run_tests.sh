#!/bin/bash

echo "=== Running Flow Tests ==="

FAILED=0

# Backend tests
echo ""
echo "--- Backend Tests ---"
cd backend
if [ -d "venv" ]; then
    source venv/bin/activate
fi
if ! pytest -v --cov=app; then
    echo "Backend tests failed."
    FAILED=1
fi
cd ..

# Frontend tests
echo ""
echo "--- Frontend Tests ---"
cd frontend
if ! npm test -- --run; then
    echo "Frontend tests failed."
    FAILED=1
fi
cd ..

# Contract tests
echo ""
echo "--- Contract Tests ---"
cd contracts
if command -v forge &> /dev/null; then
    if ! forge test -vvv; then
        echo "Contract tests failed."
        FAILED=1
    fi
else
    echo "Foundry not installed. Skipping contract tests."
    echo "Install with: curl -L https://foundry.paradigm.xyz | bash && foundryup"
fi
cd ..

echo ""
if [ $FAILED -ne 0 ]; then
    echo "=== Some Tests Failed ==="
    exit 1
else
    echo "=== All Tests Passed ==="
fi
