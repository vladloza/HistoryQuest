using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace HistoryQuest.Domain
{
    public static class Defender
    {
        public static string GenerateSalt()
        {
            byte[] data = new byte[0x10];
            using (RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider())
            {
                provider.GetBytes(data);
            }
            return Convert.ToBase64String(data);
        }

        public static string ComputeHash(string password, string salt)
        {
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] src = Convert.FromBase64String(salt);
            byte[] dst = new byte[src.Length + bytes.Length];

            Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            using (HashAlgorithm hashAlgorithm = HashAlgorithm.Create("SHA1"))
            {
                return Convert.ToBase64String(hashAlgorithm.ComputeHash(dst));
            }
        }
    }
}
