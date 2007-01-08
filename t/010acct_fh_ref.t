use Test::More tests => 27;
#use Test::More "no_plan";

use PBS::Logs;

use vars qw{@data @count};
use lib 't';
require acctdata;

my ($cnt,$a) = (0,undef);

open PL, 't/acct.20050201' or die "can not open t/acct.20050201";
my $pl = new PBS::Logs(\*PL);

is($pl->type(), "FILTER","passed acct FILEHANDLE");

cmp_ok($pl->line(),'==', $count[$cnt],		"line 0 count $cnt");
while ($a = $pl->get()) {
	cmp_ok($pl->line(),'==', $count[$cnt+1],"line count $cnt");
	is(join(' | ',@$a),$data[$cnt],		"line data $cnt");
	$cnt++;
}
cmp_ok($pl->line(),'==', -1,			"EOF count");
