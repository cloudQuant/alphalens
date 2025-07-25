#!/bin/bash
# Simple test script for alphalens across Python versions

echo "========================================"
echo "Alphalens Python Compatibility Test"
echo "========================================"
echo

# Create results directory
mkdir -p test_results

# Create summary file
summary="test_results/summary.txt"
echo "Alphalens Test Summary" > "$summary"
echo "Tested on: $(date)" >> "$summary"
echo >> "$summary"

# Initialize conda for this shell
eval "$(conda shell.bash hook)"

# Test each Python version
for v in py38 py39 py310 py311 py312 py313; do
    echo
    echo "Testing $v..."
    echo "----------------------------------------"
    
    # Check if environment exists
    if conda env list | grep -q "^$v "; then
        # Activate environment
        conda activate "$v"
        # Get Python version
        pyver=$(python --version 2>&1)
        echo "Using $pyver"
        
        # Install and test
        echo "Installing dependencies..."
        pip install -U -r requirements.txt > "test_results/${v}_install.log" 2>&1
        
        echo "Installing alphalens in development mode..."
        pip install -U -e . >> "test_results/${v}_install.log" 2>&1
        
        echo "Running tests..."
        pytest tests/ -n 8 --tb=short > "test_results/${v}_tests.log" 2>&1
        
        if [ $? -eq 0 ]; then
            echo "$v: PASSED - $pyver" >> "$summary"
            echo "[PASS] All tests passed for $v"
            
            # Extract success summary
            grep "passed" "test_results/${v}_tests.log" | grep "==" >> "$summary" || true
        else
            echo "$v: FAILED - $pyver" >> "$summary"
            echo "[FAIL] Tests failed for $v"
            
            # Extract failure summary
            grep -E "FAILED|ERROR" "test_results/${v}_tests.log" | grep -v ".py" >> "$summary" || true
        fi
        
        echo >> "$summary"
        conda deactivate
    else
        echo "$v: NOT FOUND - Conda environment missing" >> "$summary"
        echo "[SKIP] $v environment not found"
    fi
done

echo
echo "========================================"
echo "Test Summary:"
echo "========================================"
cat "$summary"
echo
echo "Detailed logs: test_results/"