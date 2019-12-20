
my $input_file="whole_document.htm";
my $output_file="index.html";

open(DATA, "<whole_document.htm") or die "Couldn't open file file.txt, $!";
open(HTML, ">index.html");

print <<_HEADER;
<html>
   <head>
      <title>stuff and all</title>
   </head>
   <body>
_HEADER

# process the big html document
my $content = 1;
my $contentFile = "";
while (<DATA>){
  if ($_ =~ "H1"){
    if ($content == 1) {
      #print "open content file to write here/n"
      print "open index file to write here/n"
      print "close content file here/n"

     my $index_file = substr($_, 7,-6);
     $index_file =~  s/(?<!^)\s(?!$)/_/g;
     
     my $line = s/H1/a href="$index_file"/;
     $line = substr($_, 3,-6);
     $line = "$line</a>";
     # s/'/H1'/'/a'/;
     print "$line \n";

     $content = 0;
     $contentFile = $index_file;
    }
  } else {
    if ($content == 0){
      print "open content file to write here/n"

    }


  }
}

print <<_FOOTER;
  </body>
</html>
_FOOTER

close(DATA);
close(HTML);
