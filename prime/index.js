function isPrime(n) {
  if (!Number.isInteger(n) || n < 2) return false;
  if (n < 4) return true;            // 2 and 3
  if (n % 2 === 0 || n % 3 === 0) return false;

  // All primes > 3 are of the form 6k ± 1
  for (let i = 5; i * i <= n; i += 6) {
    if (n % i === 0 || n % (i + 2) === 0) return false;
  }
  return true;
}

module.exports = {
    isPrime
};