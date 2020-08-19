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

  String scanQRCodeVoucher() {
    return """ 
    mutation scanQRcodeVoucher(\$input: ScanInput) {
      scanQRcodeVoucher(input: \$input) {
        status
        message
      }
    }
    """;
  }
}