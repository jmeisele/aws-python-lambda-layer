import logging
from typing import Dict

from aws_xray_sdk.core import xray_recorder, patch_all

logger = logging.getLogger()
logger.setLevel(logging.INFO)
patch_all()


def lambda_handler(event: Dict, context: Dict) -> str:
    logger.info(event)
    return "Hello from Lambda!"
