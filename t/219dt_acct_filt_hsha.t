use Test::More tests => 92;
#use Test::More "no_plan";

use PBS::Logs::Acct;

use vars qw{@data @count};
use lib 't';
require acctdata;

my ($stime,$etime) = ('02/01/2005 11:06:18','02/01/2005 11:56:09');

open PL, 't/acct.20050201' or die "can not open t/acct.20050201";
my @all = <PL>;
close PL;
my $pl = new PBS::Logs::Acct(\@all);

is($pl->type(), "ARRAY","passed array reference");

&try($pl,0,$#data);

$pl->start();
$pl->filter_datetime($stime,'none');
&try($pl,3,$#data);

$pl->start();
$pl->filter_datetime('none',$stime);
&try($pl,0,6);

$pl->start();
$pl->filter_datetime($stime,$stime);
&try($pl,3,6);

$pl->start();
$pl->filter_datetime('none','none');
&try($pl,0,$#data);

sub try {
	my ($pl,$start,$end) = @_;
	my ($cnt,$a) = (0,undef);
	cmp_ok($pl->line(),'==', $count[$cnt],		"line 0 count $cnt");
	while ($a = $pl->get_hash()) {
		cmp_ok($pl->line(),'==', $count[$start+1],"line count $cnt")
			if $start < $#data;
		my @a = @{$a}{
	@PBS::Logs::Acct::num2keys{sort keys %PBS::Logs::Acct::num2keys}};
		is(join(' | ',@a),$data[$start],	"line data $cnt");
		$cnt++;
		$start++;
	}
	fail("excess retrieved lines") if $start > $end+1;
	cmp_ok($pl->line(),'==', -1,			"EOF count");
}
