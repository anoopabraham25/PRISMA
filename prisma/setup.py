'''
#       Install Project Requirements 
'''
#packages = ['ns3gym']
from setuptools import setup, find_packages

setup(name='prisma',
    description=" Packet Routing Simulator for Multi-Agent Reinforcement Learning",
    packages=[],
    #packages=[package for package in find_packages() if package.startswith("prisma")],
    install_requires=['gym', 'numpy', 'zmq', 'tensorflow', 'networkx', 'protobuf']
)
