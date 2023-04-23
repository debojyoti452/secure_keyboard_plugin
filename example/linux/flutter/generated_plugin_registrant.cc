//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <secure_keyboard/secure_keyboard_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) secure_keyboard_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SecureKeyboardPlugin");
  secure_keyboard_plugin_register_with_registrar(secure_keyboard_registrar);
}
