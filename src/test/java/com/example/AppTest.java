public void testGreeting() {
    String result = App.getGreeting();
    assertEquals("Wrong Message!", result);  // <-- intentionally wrong
}
