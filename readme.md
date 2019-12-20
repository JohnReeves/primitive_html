# Translating Primitive HTML using perl

### script to separate a 
2MByte div-less single page html file 
in an effort to make the data useable

The html is a head & body with a single div-less structure.

Sections are implemented as:   
* starts with <p><H1> .  
* ends with <HR>
* content is a sequence of <p> tags to separate and <I> tags to highlight .  


### design-ish thoughts

Chop up the 2mb file into:   
* an index.html .  
* 26 section.html files .  

Steps in the process .  
1. Header & footer do not depend on the file data .  
2. Convert the <p><H1> line to <a href> 
3. create the section files:   
* using `section_1` as a litteral, or `<section_name>` .  
* need to detect when the section changes .  
