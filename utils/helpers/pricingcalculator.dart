class AppPricingCalculator {
  // Calculate Price Based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingRate = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingRate;
    return totalPrice;
  }

  // Calculate Shipping Cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

// Calculate Tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getShippingCost(String location) {
    return 5.00;
  }

  static double getTaxRateForLocation(String location) {
    // tax rate based on location or you use a tax rate database or api
    return 0.10;
  }
}
