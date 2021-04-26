## Firewall

A firewall is a system that provides network (hardware or software) security by filtering incoming and outgoing network traffic based on a set of user-defined rules.
In general, the purpose of a firewall is to reduce or eliminate the occurrence of unwanted network communications while allowing all legitimate communication to flow freely.

* TCP
TCP network traffic moves around a network in packets, which are containers that consist of a packet header—this contains control information such as source and destination addresses, and packet sequence information—and the data (also known as a payload). While the control information in each packet helps to ensure that its associated data gets delivered properly, the elements it contains also provides firewalls a variety of ways to match packets against firewall rules.

It is important to note that successfully receiving incoming TCP packets requires the receiver to send outgoing acknowledgment packets back to the sender. The combination of the control information in the incoming and outgoing packets can be used to determine the connection state (e.g. new, established, related) of between the sender and receiver.

## Ressources
https://www.digitalocean.com/community/tutorials/what-is-a-firewall-and-how-does-it-work

https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-14-04
