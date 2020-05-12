class SliderQuery {
  // Get the slider information.
  String getSliders() {
    return """
      query {
        sliders {
          title
          description
          imgUrl
        }
      }""";
  }
}