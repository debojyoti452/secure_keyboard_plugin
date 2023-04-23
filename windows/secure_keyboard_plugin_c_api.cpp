#include "include/secure_keyboard/secure_keyboard_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "secure_keyboard_plugin.h"

void SecureKeyboardPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  secure_keyboard::SecureKeyboardPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
