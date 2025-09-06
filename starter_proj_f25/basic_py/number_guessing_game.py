# You must guess the number I'm thinking of between 1 and n in at most log2(n) guesses. Put your guesses in a list and return it

def game(n, ans):
    pass
    #code here


def main():
    test_all_its()


# do not modify below
def test_all_its():
    test_game(100, 67)
    test_game(1000, 1)
    test_game(1000, 1000)
    test_game(1000, 500)
    test_game(1000, 750)
    test_game(1000, 250)
    test_game(345, 103)
    print("All tests passed!")


def test_game(n, ans):
    guesses = game(n, ans)
    assert guesses[-1] == n and len(guesses) <= n.bit_length()


if __name__ == "__main__":
    main()