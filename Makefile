# Catherine Nemec



CC = gcc
DEFINES =
DEBUG = -g3 -O0
#WERROR = -Werror -Wextra
# LINIX CLAGS: 
# CFLAGS = $(DEFINES) $(DEBUG) -Wall -Wextra -Wshadow -Wunreachable-code -Wredundant-decls -Wmissing-declarations -Wold-style-definition -Wmissing-prototypes -Wdeclaration-after-statement -Wno-return-local-addr -Wunsafe-loop-optimizations -Wuninitialized -Werror -g #-v
# MacOS CFLAGS:
CFLAGS = $(DEFINES) $(DEBUG) -Wall -Wextra -Wshadow -Wunreachable-code -Wredundant-decls -Wmissing-declarations -Wold-style-definition -Wmissing-prototypes -Wdeclaration-after-statement -Wno-return-local-addr  -Wuninitialized -g #-Werror -g #-v -Wunsafe-loop-optimizations

COMMENT = "This is a comment, not a comet"
PERMS = og-rx

PROG1 = mproc_crypt
PROG2 =
PROG3 =
PROGS = $(PROG1)
 
all: $(PROGS)

mproc_crypt: mproc_crypt.o
	$(CC) $(CFLAGS) -o mproc_crypt mproc_crypt.o
	# chmod $(PERMS) mproc_crypt

%.o: %.c
	$(CC) $(CFLAGS) $< -c -o $@

clean cls:
	rm -f $(PROGS) *.o *~ \#*

# https://www.youtube.com/watch?v=LHQETlv-uZs
ci chicka boom:
	if [ ! -d RCS ] ; then mkdir RCS; fi
	ci -t-none -l -m"Chicka Chicka Boom Boom - checkin" [Mm]akefile *.[ch]

# https://www.youtube.com/watch?v=4m48GqaOz90
gotta git gat:
	if [ ! -d .git ] ; then git init; fi
	git add *.[ch] ?akefile
	git commit -m "The Black Eyed Peas - check in"

TAR_FILE = ${LOGNAME}_$(PROG1).tar.gz
tar:
	rm -f $(TAR_FILE)
	tar cvaf $(TAR_FILE) *.[ch] [Mm]akefile
	tar tvaf $(TAR_FILE)

comment:
	echo $(COMMENT)

opt:
	make clean
	make DEBUG=-O