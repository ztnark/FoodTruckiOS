extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_EFB080A9BE104786A87008C3BDFD3D4C(void *, void *);
void MREP_BA7783D262B142E79A49C460E6CE8110(void *, void *);
void MREP_088844640AC3430E95970AC582AC7E16(void *, void *);
void MREP_CF8182FE5E694B269DDD3180C443BE2E(void *, void *);
void MREP_7A3777F1E86948DEA5646D89DCA9DD5D(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
#if !__LP64__
	try {
#endif
	    void *self = rb_vm_top_self();
rb_define_global_const("RUBYMOTION_ENV", @"development");
rb_define_global_const("RUBYMOTION_VERSION", @"2.11");
MREP_EFB080A9BE104786A87008C3BDFD3D4C(self, 0);
MREP_BA7783D262B142E79A49C460E6CE8110(self, 0);
MREP_088844640AC3430E95970AC582AC7E16(self, 0);
MREP_CF8182FE5E694B269DDD3180C443BE2E(self, 0);
MREP_7A3777F1E86948DEA5646D89DCA9DD5D(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
