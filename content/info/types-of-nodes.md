# The types of nodes in Stonenet

Stonenet is a peer-to-peer network, intended to be available to anyone and everyone.
But most home computers are behind some sort of NAT device (e.g. a router), which limits the communication options of your node with the other nodes in the network.

To help these nodes interact with the network, the built-in transport protocol allows for setting up connections through other nodes who may help you.
Techniques such as relaying or UDP hole punching are used to make this possible.
Moreover, the transport protocol can be used over both UDP & TCP, using IPv4 or IPv6. So that devices from as many networks can interact with the Stonenet network.

## Server nodes

Nodes that are not impeded by a NAT device or router, and have the ability to receive TCP connection or initial UDP packets, are helpful to the network because they can help setting up a connection between other nodes if one of them supports hole punching or receiving a connection.
I call this a server node in this guide, because a lot of time these nodes are actually run a VPS or server.

In order to run a server node, one of the following configuration parameters need to be set to `"bidirectional"` (meaning, connections can be freely opened from both directions):
```
ipv4_udp_openness
ipv4_tcp_openness
ipv6_udp_openness
ipv6_tcp_openness
```
But, it's best to set all of them to be bidirectional, if the firewall allows for it.

## Relay nodes

Another more important type of node, is the 'relay node'. A relay node helps two other nodes that are trying to connect to eachother by simply relaying all the packets that they exchange.
All packets are end-to-end encrypted and so the relay node will not be able to know what is communicated.

Whether you want to provide this type of service to the network is up to you, as it may come with some legal & moral concerns. But if you do, you can simply set the `relay_node` parameter to true in the config.
