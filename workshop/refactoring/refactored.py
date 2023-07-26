import random

def is_divisible(number, *divisors):
    for div in divisors:
        if number % div == 0:
            return True
    return False

def gen_random_numbers(count, from_, to):
    for _ in range(GEN_NUMBERS):
        yield random.randint(1, UPPER_LIMIT)

def main():
    result = []

    count = 10
    lower_limit = 1
    upper_limit = 100
    numbers = gen_random_numbers(count, lower_limit, upper_limit)

    for n in numbers:
        if is_divisible(n, 7, 11):
            result.append(n)
            print(n, "is divisible by 7 or 11")
    print("found", len(result), "numbers divisible by 7 or 11")

if __name__ == "__main__":
    main()
