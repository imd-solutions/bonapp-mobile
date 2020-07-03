class ScanMutation {
  String scanQRCode() {
    return """ 
    mutation scanQRcode(\$input: ScanInput) {
      scanQRcode(input: \$input) {
        status
        message
      }
    }
    """;
  }
}