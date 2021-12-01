module immutability.immutability;

inout(char)* strstr(inout(char)* haystack, in char* needle) {
  while (*haystack) {
    if (*haystack == *needle) {
      char* h = haystack;
      char* n = needle;
      while (*h && *n && *h == *n) {
        h++;
        n++;
      }
      if (!*n) {
        return haystack;
      }
    }
    haystack++;
  }
  return 0;
}
