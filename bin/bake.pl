#!/usr/bin/env perl

#  bakes the website from yaml data using template toolkit templates ..

use strict;
use POSIX qw(strftime);

use Template;

use YAML qw(LoadFile);
use JSON;
use XML::Simple;

chdir('templates');

my $verbose = 1;
my $indir = "../config";
my $outdir = "../site";

my $tt = Template->new();

mkdir($outdir);
mkdir("$outdir/event");

{
    my $site = LoadFile("$indir/site.yaml");
    my $json = new JSON;
    $json->canonical();
    my $xml = XML::Simple->new(XMLDecl => 1, NoAttr => 1);

    $site->{keywords} = join(",", @{$site->{tags}});
    $site->{keywords} =~ s/-/,/g;

    $site->{updated} = strftime("%Y-%m-%dT%H:%M:%SZ", gmtime(time()));

    #
    #  site .htaccess
    #
    template("htaccess", $site, ".htaccess");

    #
    #  site stylesheet
    #
    template("main.css", $site, "styles/main.css");


    #
    #  site json/xml
    #
    saveAs("index.json", $json->pretty->encode($site));
    saveAs("index.xml", $xml->XMLout($site, RootName => 'site'));

    #
    #  add events 
    #
    my @media = keys %{$site->{media}};
    unshift(@media, 'html');

    foreach my $ev (@{$site->{released}}) {
        my $file = "$indir/$ev.yaml";
        my $event = LoadFile($file);
        my $n = $event->{number};
        $event->{uri} = $site->{uri} . "event/$n";

        push(@{$site->{events}}, $event);
    }

    #
    #  index templates
    #
    foreach my $media (@media) {
        template("index.$media", $site, "index.$media");
    }

    #
    #  event templates
    #
    foreach my $media (@media) {
        foreach my $event (@{$site->{events}}) {
            my $n = $event->{number};
            $site->{event} = $event;
            template("event.$media", $site, "event/$n.$media");
        }
    }

    #
    #  event json/xml
    #
    foreach my $event (@{$site->{events}}) {
        my $n = $event->{number};
        saveAs("event/$n.json", $json->pretty->encode($event));
        #saveAs("event/$n.xml", $xml->XMLout($event, RootName => 'event'));
    }
}

exit 0;

#
#  run template ..
#
sub template
{
    my ($template, $site, $output) = @_;
    my $path = "$outdir/$output";
    if (-f $template) {
        print "$path\n" if ($verbose);
        $tt->process($template, $site, $path) || die $tt->error;
    }
}

#
#  create file ..
#
sub saveAs
{
    my ($filename, $content) = @_;
    local (*FILE);
    my $path = "$outdir/$filename";
    print "$path\n" if ($verbose);
    open FILE, "> $path";
    print FILE $content;
    close FILE;
}
