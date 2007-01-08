use Test::More tests => 55;
#use Test::More "no_plan";

use PBS::Logs::Acct;

use vars qw{@data @count};
use lib 't';
require acctdata;

my ($cnt,$a) = (0,undef);

open PL, 't/acct.20050201' or die "can not open t/acct.20050201";
my @all = <PL>;
close PL;
my $pl = new PBS::Logs::Acct(\@all);

is($pl->type(), "ARRAY","passed acct array reference");

cmp_ok($pl->line(),'==', $count[$cnt],		"line 0 count $cnt");
while ($a = $pl->get()) {
	cmp_ok($pl->line(),'==', $count[$cnt+1],"line count $cnt");
	is(join(' | ',@$a),$data[$cnt],		"line data $cnt");
	$cnt++;
}
cmp_ok($pl->line(),'==', -1,			"EOF count");

# restart

$pl->start();
($cnt,$a) = (0,undef);

cmp_ok($pl->line(),'==', $count[$cnt],		"2line 0 count $cnt");
while ($a = $pl->get()) {
	cmp_ok($pl->line(),'==', $count[$cnt+1],"2line count $cnt");
	is(join(' | ',@$a),$data[$cnt],		"2line data $cnt");
	$cnt++;
}
cmp_ok($pl->line(),'==', -1,			"2EOF count");

$pl->end();

ok(! defined $pl->type(), 			"end type");
ok(! defined $pl->line(), 			"end line");
