use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

use Mojolicious::Types;

my $t = Test::Mojo->new('EchoBin');
my $types = Mojolicious::Types->new;

my ($status, $ext);

$ext = 'html';
$status = 200;
$t->get_ok("/status")
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$t->get_ok("/status/$status")
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$status = 300;
$t->get_ok("/status/$status")
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$status = 404;
$t->get_ok("/status/$status")
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$status = 500;
$t->get_ok("/status/$status")
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);


$status = 418;
$ext = 'json';
$t->get_ok("/status/$status.$ext")
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$t->get_ok("/status/$status", {'Content-Type' => $types->type($ext)})
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$ext = 'txt';
$t->get_ok("/status/$status.$ext")
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$t->get_ok("/status/$status", {'Content-Type' => $types->type($ext)})
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$ext = 'xml';
$t->get_ok("/status/$status.$ext")
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$t->get_ok("/status/$status", {'Content-Type' => $types->type($ext)})
    ->status_is($status)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/$status/);

$ext = 'html';
$status = 999;
$t->get_ok("/status/$status")
    ->status_is(400)
    ->content_type_is($types->type($ext), 'Right content type is '. $ext)
    ->content_like(qr/Bad Request/i);

$status = 99;
$t->get_ok("/status/$status")
    ->status_is(404);

done_testing();