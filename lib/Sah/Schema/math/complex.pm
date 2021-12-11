package Sah::Schema::math::complex;

use strict;

use Math::Complex ();

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [obj => {
    summary   => 'Complex number',
   description => <<'_',

A <pm:Math::Complex> object, coercible from string in the form of "<a> + <b>i".

_
    isa => 'Math::Complex',
    'x.perl.coerce_rules' => ['From_str::math_complex'],

    examples => [
        {value=>'', valid=>0, summary=>"Empty string"},
        {value=>'abc', valid=>0, summary=>"Not in the form of a+bi"},
        {value=>Math::Complex->make(5,6), valid=>1},
        {value=>"5 + 6i", valid=>1, validated_value=>Math::Complex->make(5, 6)},
    ],
}];

1;
# ABSTRACT:
