# Using Stonenet with the Fediverse

The 'Fediverse' is a federated network of servers, generally used for social media.
Stonenet is a peer-to-peer network for social media, but the software can be deployed to participate in the fediverse as well.
The only requirement is that you set up a node somewhere on a server, like a VPS for example.
The node can be configured to be subscribed to a set of profiles, and will then gather all its data like any other node, while providing a public accessible web interface that supports ActivityPub.
This way, your node will act as a sort of 'gateway' between Stonenet and the fediverse.
Meanwhile, your local client is able to 'subscribe' to other profiles on the fediverse, and will collect all the posts similarily to how a RSS feed is gathered.
This way, with Stonenet, you are able to participate in the fediverse, but your Stonenet posts will only be shared into the fediverse when you put up a server for it.

## Configuration

In order to configure a node as a gateway to the fediverse, there are two simple configuration parameters to set in the config file (`/etc/stonenet/config.toml`).
Set `load_web_interface` to `true`, and optionally set `web_interface_port` to anything you like.
Then, set the `track` parameter to a list of profile IDs:
```
load_web_interface = true
web_interface_port = 80
track = ["2KLquvVSCjtJGwtNENhkCnpJQnZN1xJZeDNbzSGtrkEKFX"]
```

Then, there are some additional config parameters to set for better ActivityPub integration.
See [this config](https://github.com/bamidev/stonenet/blob/main/conf/default.toml#L101).

## Client

In the Stonenet client, you can simply add the address of the profile to the search bar.
Once navigated to the profile, you can click on the subscribe button, like you would with any other Stonenet profile as well.
Then you should start seeing the posts show up in your own home feed in the Stonenet client.
