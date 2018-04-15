module square;


extern(C) nothrow {
    int square (int x);
}

bool testSquare() {
    return square(2) == 4 && square(5) == 25;
}
