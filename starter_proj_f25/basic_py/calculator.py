# Build a text based calculator

class Calculator:
    def __init__():
        pass

    def add():
    # pass placeholder
        pass

    def subtract():
        pass

    def multiply():
        pass

    def divide():
        pass

    def remainder():
        pass

    def sin(): # input is an angle
        pass

    def change_angle_mode(new_mode: str): # degrees or radians ('deg' or 'rad')
        pass

    def memory_store():
        pass

    def memory_recall():
        pass

    # implement something more complex of your chioce


def main():
    # Code here
    test_calculator()


# Testing code.. DO NOT MODIFY
def test_calculator():
    calc = Calculator('rad')
    assert calc.add(1, 2) == 3
    assert calc.subtract(5, 3) == 2
    assert calc.multiply(4, 3) == 12
    assert calc.divide(10, 2) == 5
    assert calc.remainder(10, 3) == 1
    calc.memory_store(42)
    assert calc.divide(calc.memory_recall(), 2) == 21
    assert round(calc.sin(3.14159/2), 5) == 1
    calc.change_angle_mode('deg')
    assert round(calc.sin(90), 5) == 1
    print("All tests passed!")


if __name__ == "__main__":
    main()