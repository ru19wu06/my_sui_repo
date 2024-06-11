
#[test_only]
module test_demo::test_demo_tests {
    // uncomment this line to import the module
    // use test_demo::test_demo;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_test_demo() {
        // pass
    }

    #[test, expected_failure(abort_code = ::test_demo::test_demo_tests::ENotImplemented)]
    fun test_test_demo_fail() {
        abort ENotImplemented
    }
}
