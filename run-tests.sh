#!/bin/bash


passed_tests=0
failed_tests=0
failed_test_names=()

for file in tests/*.test.sh; do
    echo "Running $file..."
    if $file; then
        echo "TEST PASSED: $file"
        ((passed_tests++))
    else
        echo "TEST FAILED: $file"
        ((failed_tests++))
        failed_test_names+=("$file")
    fi
done

echo -e "\nTest Summary:"
echo "Passed tests: $passed_tests"
echo "Failed tests: $failed_tests"

if [ $failed_tests -gt 0 ]; then
    echo -e "\nFailed test files:"
    for test in "${failed_test_names[@]}"; do
        echo "- $test"
    done
    exit 1
fi
