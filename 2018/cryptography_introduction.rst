
Cryptography Introduction
==============================

.. post:: Jan 07, 2018
   :tags: security
   :category: ComputerScience

System.Random and Its Problems 

* System.Random is a pseudo random number generator 
* A seed value is passed into the constructor 
* The seed value should be different each time 
* System.Random is deterministic and predictable 

.. code:: 

      public static byte[] GenerateRandomNumber(int length)
      {
        using (var randomNumberGenerator = new RNGCryptoServiceProvider())
        {
          var randomNumber = new byte[length];
          randomNumberGenerator.GetBytes((randomNumber));

          return randomNumber;
        }

What Is Hashing? 

* It is easy to compute the hash value for any given message 
* It is infeasible to generate a message that has a given hash 
* It is infeasible to modify a message without changing the hash 
* It is infeasible to find two different messages with the same hash 

HashAlgorithm

* MD5
* SHA-1
* SHA-256
* SHA-512

Hashing: One Way operation
Encryption: two way operation

MD5

* Designed by Ron Rivest in 1991 to replace MD4 
* Produces a 128 bit (16 byte) hash value 
* Commonly used to verify file integrity 
* First collision resistance flaw found in 1996 
* Recommendation was to move over to the Secure Hash Family 
* Further collision resistance problems found in 2004 
* Still needed when integrating with legacy systems 

SHA1
SHA2: SHA256, SHA512
SHA3: not supported in .net so far (2015)

.. code:: 

    public class HashData
    {
      public static byte[] ComputeHashSha1(byte[] toBeHashed)
      {
        using (var sha1 = SHA1.Create())
        {
          return sha1.ComputeHash(toBeHashed);
        }
      }

      public static byte[] ComputeHashSha256(byte[] toBeHashed)
      {
        using (var sha256 = SHA256.Create())
        {
          return sha256.ComputeHash(toBeHashed);
        }
      }

      public static byte[] ComputeHashSha512(byte[] toBeHashed)
      {
        using (var sha512 = SHA512.Create())
        {
          return sha512.ComputeHash(toBeHashed);
        }
      }

      public static byte[] ComputeHashMd5(byte[] toBeHashed)
      {
        using (var md5 = MD5.Create())
        {
          return md5.ComputeHash(toBeHashed);
        }
      }
    }

Hash algorithm with key
Hashed Message Authentication Codes

.. code:: 

    public class Hmac
    {
        private const int KeySize = 32;

        public static byte[] GenerateRandomKey()
        {
        using (var randomNumberGenerator = new RNGCryptoServiceProvider())
        {
            var randomNumber = new byte[KeySize];
            randomNumberGenerator.GetBytes((randomNumber));

            return randomNumber;
        }
        }

        public static byte[] ComputeHmacsha256(byte[] toBeHashed, byte[] key)
        {
        using (var hmac = new HMACSHA256(key))
        {
            return hmac.ComputeHash(toBeHashed);
        }
        }

        public static byte[] ComputeHmacsha1(byte[] toBeHashed, byte[] key)
        {
        using (var hmac = new HMACSHA1(key))
        {
            return hmac.ComputeHash(toBeHashed);
        }
        }
    }

Store password: store plain text and encrypted password is not good idea
Store hash since it cannot be reversed

