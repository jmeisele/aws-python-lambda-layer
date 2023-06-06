from typing import Dict


def lambda_handler(event: Dict, context: Dict) -> str:
    print(event)
    return "Hello from Lambda!"
