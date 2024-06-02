locals {
  # secret_stringを設定しており、ここが反映されるのは初回構築時のみ。
  secrets = {
      key1 = null
      key2 = null
      key3 = null
  }
}
