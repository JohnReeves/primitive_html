
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
while (<DATA>){
  if ($_ =~ "H1"){
     my $index_file = substr($_, 7,-6);
     $index_file =~  s/(?<!^)\s(?!$)/_/g;
     s/H1/a href="$index_file"/;
     s/'/H1'/'/a'/;
     print "$_";
  }
}

print <<_FOOTER;
  </body>
</html>
_FOOTER

close(DATA);
close(HTML);
