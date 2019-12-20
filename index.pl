
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
my @sections = [];

      # print "open content file to write here/n"
      # print "open index file to write here/n";
      # print "close content file here/n";

# process in 2 passes:
# 1. read section headings into an array
# - open index file & process heading as below
# - copy file names into the array
# 2. copy sections into a new file
# - at each heading open a new file
# - copy contents until the next heading
# - close the previous section's file & copy new contents
#

while (<DATA>){
  if ($_ =~ "H1"){
     my $index_file = substr($_, 7,-6);
     $index_file =~  s/(?<!^)\s(?!$)/_/g;
     
     my $line = s/H1/a href="$index_file"/;
     $line = substr($_, 3,-6);
     $line = "$line</a>";
     # s/'/H1'/'/a'/;
     print "$line \n";
     @filenames.append($index_file);
    }
}
print @filenames;

print <<_FOOTER;
  </body>
</html>
_FOOTER

close(DATA);
close(HTML);
