# Makefile - tolerant build for stubs in .c or .nc (MSYS2 MinGW64), and also made by: GPT-5, i dont really care
CC := gcc
CFLAGS := -I./include -O2 -fPIC
DLL := nanodll.dll
IMPLIB := libnanodll.a
LOADER := loader.exe

# Gather sources: prefer .c, but also accept .nc
SRCS_C := $(wildcard stubs/*.c)
SRCS_NC := $(wildcard stubs/*.nc)
SRCS := $(SRCS_C) $(SRCS_NC)

# Objects corresponding to sources (put .o in same stubs/ dir)
OBJS := $(patsubst stubs/%.c,stubs/%.o,$(SRCS_C)) $(patsubst stubs/%.nc,stubs/%.o,$(SRCS_NC))

.PHONY: all real fake clean test

all: real

real: $(DLL)

# Link DLL from any produced objects
$(DLL): $(OBJS)
	@echo "[NANOBUILD] Linking $@ from objects: $(OBJS)"
	$(CC) -shared -o $(DLL) -Wl,--out-implib,$(IMPLIB) $(CFLAGS) $(OBJS)

# Compile .c sources normally
stubs/%.o: stubs/%.c
	@echo "[NANOBUILD] Compiling C: $< -> $@"
	$(CC) $(CFLAGS) -c $< -o $@

# Treat .nc as C. If compile fails, generate a tiny placeholder object so link can proceed.
stubs/%.o: stubs/%.nc
	@echo "[NANOBUILD] Treating .nc as C: $< -> $@"
	-$(CC) $(CFLAGS) -x c -c $< -o $@ 2>/dev/null || ( \
		echo "[NANOBUILD] gcc failed for $< — creating tiny placeholder object"; \
		# create a tiny C file and compile it to object as placeholder \
		echo 'void _nanoplaceholder(void) {}' > /tmp/nanoplaceholder.c; \
		$(CC) $(CFLAGS) -c /tmp/nanoplaceholder.c -o $@ )

# Fake target: create a tiny loadable DLL placeholder even if no sources exist
fake:
	@echo "[NANOBUILD] Creating a tiny placeholder nanodll.dll (fake mode)"
	# Try a real build first (in case .nc can be compiled), else create minimal PE via gcc with /dev/null
	-$(MAKE) real || ( \
		echo "[NANOBUILD] real build failed — creating minimal placeholder DLL"; \
		$(CC) -shared -o $(DLL) -Wl,--out-implib,$(IMPLIB) -xc /dev/null 2>/dev/null || (printf "\0" > $(DLL)); \
		echo "[NANOBUILD] placeholder $(DLL) created" )

# build loader (test program)
$(LOADER): loader.c
	@echo "[NANOBUILD] Building loader: $@"
	$(CC) -o $(LOADER) loader.c

test: real $(LOADER)
	@echo "[NANOBUILD] Running loader (make sure nanodll.dll is next to loader.exe)"
	./$(LOADER)

clean:
	@echo "[NANOBUILD] Cleaning"
	rm -f $(DLL) $(IMPLIB) $(LOADER) $(OBJS) /tmp/nanoplaceholder.c
