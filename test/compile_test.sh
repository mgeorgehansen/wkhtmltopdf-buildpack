#!/bin/bash
. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

test_compiles() {
    compile
    assertCapturedSuccess
}

test_shared_libs() {
    compile

    . ${BUILDPACK_HOME}/export
    cat <<EOF > "${BUILD_DIR}/test.c"
#include <wkhtmltox/pdf.h>

int main()
{
    wkhtmltopdf_init(0);
    wkhtmltopdf_deinit();

    return 0;
}
EOF
    capture gcc "${BUILD_DIR}/test.c" -o "${BUILD_DIR}/test" -lwkhtmltox
    assertCapturedSuccess

    capture "${BUILD_DIR}/test"
    assertCapturedSuccess
}
