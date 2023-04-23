#ifndef FLUTTER_PLUGIN_SECURE_KEYBOARD_PLUGIN_H_
#define FLUTTER_PLUGIN_SECURE_KEYBOARD_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace secure_keyboard {

class SecureKeyboardPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SecureKeyboardPlugin();

  virtual ~SecureKeyboardPlugin();

  // Disallow copy and assign.
  SecureKeyboardPlugin(const SecureKeyboardPlugin&) = delete;
  SecureKeyboardPlugin& operator=(const SecureKeyboardPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace secure_keyboard

#endif  // FLUTTER_PLUGIN_SECURE_KEYBOARD_PLUGIN_H_
