class SettingsQuery {
  // Get the application information.
  String getApplicationSettings() {
    return """
            query {
              app {
                brightness
                primary
                accent
                background
                intro_slider
                intro_full
              }
            }
      """;
  }
}