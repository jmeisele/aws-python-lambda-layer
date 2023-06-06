from src.handler import lambda_handler


def test_lambda_handler() -> None:
    result = lambda_handler(event={}, context={})
    assert result == "Hello from Lambda!"
