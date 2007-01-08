use Test::More tests => 57;
#use Test::More "no_plan";

use PBS::Logs;

use vars qw{@data};
use lib 't';
require momdata;

my ($cnt,$a) = (0,undef);

my $pl = new PBS::Logs('t/mom.20050304');

is($pl->type(), "FILE",	"passed filename");

cmp_ok($pl->line(),'==', $cnt,			"line 0 count $cnt");
while ($a = $pl->get()) {
	cmp_ok($pl->line(),'==', $cnt + 1,	"line count $cnt")
		if $cnt < $#data;
	is(join(' | ',@$a),$data[$cnt],		"line data $cnt");
	$cnt++;
}
cmp_ok($pl->line(),'==', -1,			"EOF count");

# restart

$pl->start();
($cnt,$a) = (0,undef);

cmp_ok($pl->line(),'==', $cnt,			"2line 0 count $cnt");
while ($a = $pl->get()) {
	cmp_ok($pl->line(),'==', $cnt + 1,	"2line count $cnt")
		if $cnt < $#data;
	is(join(' | ',@$a),$data[$cnt],		"2line data $cnt");
	$cnt++;
}
cmp_ok($pl->line(),'==', -1,			"2EOF count");

$pl->end();

ok(! defined $pl->type(), 			"end type");
ok(! defined $pl->line(), 			"end line");
