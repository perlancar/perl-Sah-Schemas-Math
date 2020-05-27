package Data::Sah::Coerce::perl::To_obj::From_str::math_complex;

# AUTHOR
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Regexp::Pattern::Float;

my $re_float_decimal =
    $Regexp::Pattern::Float::RE{float_decimal}{pat};
my $re_float_decimal_or_exp =
    $Regexp::Pattern::Float::RE{float_decimal_or_exp}{pat};

sub meta {
    +{
        v => 4,
        summary => 'Coerce complex number from string in the form of "a + bi"',
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    # TODO: allow a, or bi in addition to a + bi
    $res->{expr_match} = "$dt =~ m(\\A($re_float_decimal_or_exp)\\s*\\+\\s*($re_float_decimal)*?i\\z)";
    $res->{module}{"Math::Complex"} //= 0;
    $res->{expr_coerce} = join(
        '',
        'Math::Complex->make($1, $2)',
    );
    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|coerce)$
