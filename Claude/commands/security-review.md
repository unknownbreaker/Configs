Review this code for security vulnerabilities.

Check for:

1. Injection vulnerabilities (SQL, command, XSS, path traversal)
2. Authentication/authorization issues
3. Sensitive data exposure (logging, error messages, hardcoded secrets)
4. Insecure dependencies
5. Race conditions and TOCTOU issues
6. Improper error handling that leaks info
7. Insecure cryptographic practices

For each issue found, report:

- **Severity**: Critical / High / Medium / Low
- **Location**: file:line
- **Issue**: What's wrong
- **Risk**: What could happen
- **Fix**: How to remediate

If no issues found, say so—but also note any areas that warrant extra scrutiny.
