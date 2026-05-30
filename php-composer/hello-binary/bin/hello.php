<?php
# Minimal PHP executable for the M57 ``php-composer/hello-binary``
# fixture. Composer's launcher shim (emitted under
# ``<root>/.repro/build/hello/hello.cmd``) invokes
# ``php bin/hello.php`` so this file is the actual entry point.
#
# Uses only PHP's built-in ``echo`` so the build needs no Packagist
# packages — keeping the M57 offline-mode contract trivially
# satisfied.

echo "hello from php-composer-hello-binary\n";
