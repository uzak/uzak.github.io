def twice(number):
    return 2 * number

def doubled(numbers):
    doubled_numbers = []
    for num in numbers:
        doubled_numbers.append(twice(num))
    return numbers

def main():
    numbers = [1, 2, 3, 4]
    doubled_numbers = doubled(numbers)
    print(doubled_numbers)
