import unittest
from sample import start

class StartTests(unittest.TestCase):
    def test_sayHello(self):
        self.assertEquals('hello', start.sayHello())


if __name__ == '__main__':
    unittest.main()
