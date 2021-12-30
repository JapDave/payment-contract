from brownie import accounts,config,Gateway,network
import os


def deploy_contract():
   try:
      price_feed_address = config["networks"][network.show_active()][
            "eth_usd_price_feed"
        ]
      account = accounts.add(config['wallets']['fromkey'])
      Gateway.deploy(price_feed_address,{'from':account})
   except Exception as e:
      print(e)
   
def main():
   deploy_contract()
