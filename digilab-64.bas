5 print chr$(147);
10 print " +------------------------------------+"
20 print " !             digilab 64             !"
30 print " !   (c)2023 by ir. marc dendooven    !"
40 print " +------------------------------------+"

100 gosub 300: rem set up circuit
110 read sw:print sw;"sweep(s)":print
112 for i=0 to ip-1:print i;:next:print "!";
114 for i=n-op to n-1:print i;:next
116 print:print "---------------------------"
120 for s=1 to sw
130    gosub 600: rem sweep trough
140 next s
150 end

300 rem *** set up circuit ***
310 read n,g:print n;"nodes";g;"gates"
320 dim n(1,n-1)
330 dim a(g-1),b(g-1),c(g-1)
340 for i=0 to g-1
350    print "  gate";i;":";
360    read a(i),b(i),c(i):print a(i);b(i);c(i)
370 next i
380 read ip,op:print ip;"input pin(s),";op;"output pin(s)"
390 return

600 rem *** sweep ***
630 rem print "set input pins"
640 for i=0 to ip-1
650    read v
660    n(0,i)=v:n(1,i)=v
670 next i
680 for i=ip to n-1:n(1-j,i)=0:next
700 for i=0 to g-1
710    n(1-j,c(i))=n(1-j,c(i)) or (not(n(j,a(i)) and n(j,b(i))))
720 next i
730 eq=-1
732 for i=ip to n-1
733     if n(0,i)<>n(1,i) then eq=0
735 next
740 if eq=0 then j=1-j:goto 680 
805 for i=0 to ip-1:print n(1-j,i);:next:print "!";
810 for i=n-op to n-1:print n(1-j,i);:next
820 print
830 return

1000 rem *** fill in your data here ***
1010 rem #nodes, #gates
1020 data 6,4
1030 rem for each gate enter a,b,c
1040 data 0,1,2
1042 data 0,2,3
1043 data 2,1,4
1045 data 3,4,5
1050 rem enter #input and #output pins
1060 data 2,1
1070 rem enter #sweeps
1080 data 4
1100 rem enter values of input pins for each sweep
1110 data 0,0
1120 data 0,-1
1130 data -1,0
1140 data -1,-1
