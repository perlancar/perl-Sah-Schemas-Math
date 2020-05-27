package Sah::Schema::math::complex;

# AUTHORITY
# DATE
# DIST
# VERSION

use Math::Complex ();

our $schema = [obj => {
    summary   => 'Complex number',
   description => <<'_',

See also `posfloat` for floats that are larger than 0.

_
    isa => 'Math::Complex',
    'x.perl.coerce_rules' => ['From_str::math_complex'],

    examples => [
        {value=>'', valid=>0},
        {value=>'abc', valid=>0},
        {value=>Math::Complex->make(5,6), valid=>1},
        {value=>"5 + 6i", valid=>1, validated_value=>Math::Complex->make(5, 6)},
    ],
}, {}];

1;
# ABSTRACT:
