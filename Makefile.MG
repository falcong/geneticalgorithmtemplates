ARCHIVE-NAME = gat.rename.zip
ARCHIVE_NAME = $(ARCHIVE-NAME)
# make archive ARCHIVE_NAME=newname.zip
# or use ARCHIVE-NAME as an alias
INCLUDESTL = -I /usr/include/g++-3
FUTURE = -std=gnu++0x
FLAGS = $(INCLUDESTL) -Wall -Wno-deprecated -lstdc++ $(FUTURE) 
FAST = -O3 -DNDEBUG
GCC = g++ $(FLAGS)

archive:
	zip $(ARCHIVE_NAME) GA*.h MGalgo.h *.idea AUTHORS CHANGELOG COPYING *.cpp Makefile.MG

save-archive: archive
	su -c 'cp $(ARCHIVE_NAME) ~quake/dos_shared'

happyfaces: *.h testhappyfaces.cpp GAhappyfaces.cpp
	$(GCC) $(FAST) -o happy_faces_opt testhappyfaces.cpp GAhappyfaces.cpp 

happysolution: *.h happyfacessolution.cpp GAhappyfaces.cpp
	$(GCC) $(FAST) -o happy_faces_solution happyfacessolution.cpp GAhappyfaces.cpp 

testsuite: *.h main.cpp
	$(GCC) -o gat7 main.cpp

debug: *.h main.cpp
	$(GCC) -gstabs+ -o gat7d main.cpp

profile: *.h main.cpp
	$(GCC) -gstabs+ -p -a -ax -o gat7p main.cpp

fast: *.h main.cpp
	$(GCC) $(FAST) -o gat7o main.cpp

clean:
	rm -f *.o