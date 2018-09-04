#include <mruby.h>
#include <mruby/irep.h>

#include <rasm.h>

#include "../assets/rasm_app.c"

WASM_EXPORT int main(int argc, char* *argv) {
  mrb_state *mrb = mrb_open();

  mrb_load_irep(mrb, rasm_app);

  if (mrb->exc) mrb_print_error(mrb);

  mrb_close(mrb);

  return 0;
}
