#!/usr/bin/env python3

import hashlib
import uuid
import base64


def compute_sha256_base64(string):
  """Computes the SHA-256 hash of a given string and base64 encodes the result.

  Args:
    string: The input string to hash.

  Returns:
    The base64-encoded SHA-256 hash of the input string.
  """

  # Compute the SHA-256 hash
  sha256_hash = hashlib.sha256(string.encode('utf-8')).digest()

  # Base64 encode the hash
  base64_encoded_hash = base64.b64encode(sha256_hash).decode('utf-8')

  return base64_encoded_hash

if __name__ == "__main__":
    license_id = str(uuid.uuid4())
    server_id = compute_sha256_base64(license_id)
    print(f"License ID: {license_id}")
    print(f"Server ID (to be shared with Mendix Support): {server_id}")
