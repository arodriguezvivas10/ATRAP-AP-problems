(define (problem instance-4n-6s-3v)

	(:domain domain-4n-6s-3v)

	(:objects
		; SUBSTRATE NETWORK
		; Physical Nodes
		n1 - node1
		n2 - node2
		n3 - node3
		n4 - node4
		; Physical Paths
		; All paths are bidirectionals
		n1-n2 - path-n1-n2
		n1-n3 - path-n1-n3
		n2-n4 - path-n2-n4
		n3-n4 - path-n3-n4
		n1-n4 - c-path-n1-n4
		n2-n3 - c-path-n2-n3
		inner-path-n1 - inner-path1
		inner-path-n2 - inner-path2
		inner-path-n3 - inner-path3
		inner-path-n4 - inner-path4

		; Network Slice 1 
		amf0-1 - amf0-ns1
		smf0-1 - smf0-ns1 
		upf0-1 - upf0-ns1
		amf0-smf0-1 - link-amf0-smf0-ns1
		smf0-upf0-1 - link-smf0-upf0-ns1

		; Network Slice 2 
		amf0-2 - amf0-ns2
		smf0-2 - smf0-ns2
		upf0-2 - upf0-ns2
		amf0-smf0-2 - link-amf0-smf0-ns2
		smf0-upf0-2 - link-smf0-upf0-ns2

		; Network Slice 3 
		amf0-3 - amf0-ns3
		smf0-3 - smf0-ns3 
		upf0-3 - upf0-ns3
		amf0-smf0-3 - link-amf0-smf0-ns3
		smf0-upf0-3 - link-smf0-upf0-ns3

		; Network Slice 4 
		amf0-4 - amf0-ns4
		smf0-4 - smf0-ns4
		upf0-4 - upf0-ns4
		amf0-smf0-4 - link-amf0-smf0-ns4
		smf0-upf0-4 - link-smf0-upf0-ns4

		; Network Slice 5 
		amf0-5 - amf0-ns5
		smf0-5 - smf0-ns5
		upf0-5 - upf0-ns5
		amf0-smf0-5 - link-amf0-smf0-ns5
		smf0-upf0-5 - link-smf0-upf0-ns5

		; Network Slice 6 
		amf0-6 - amf0-ns6
		smf0-6 - smf0-ns6 
		upf0-6 - upf0-ns6
		amf0-smf0-6 - link-amf0-smf0-ns6
		smf0-upf0-6 - link-smf0-upf0-ns6
		)

	(:init
		(=(substrate-cpu-capacity) 112) ; 4 CPUs x 28 cores
        (=(substrate-bandwidth-capacity) 400) ; 2*200Mbps
		(=(vnfs-required-cpu) 4.0)
        (=(required-bandwidth-urllc) 20)
        (=(scaling-factor) 3)

		; SUBSTRATE NETWORK
		; All paths are bidirectionals
		(adjacent-nodes-i-j n1-n2 n1 n2)
		(adjacent-nodes-j-i n1-n2 n2 n1)

		(adjacent-nodes-i-j n1-n3 n1 n3)
		(adjacent-nodes-j-i n1-n3 n3 n1)

		(adjacent-nodes-i-j n2-n3 n2 n3)
		(adjacent-nodes-j-i n2-n3 n3 n2)

		(adjacent-nodes-i-j n3-n4 n3 n4)
		(adjacent-nodes-j-i n3-n4 n4 n3)

		(adjacent-nodes-i-j n1-n4 n1 n4)
		(adjacent-nodes-j-i n1-n4 n1 n4)

		(adjacent-nodes-i-j n2-n4 n2 n4)
		(adjacent-nodes-j-i n2-n4 n4 n2)

		(adjacent-nodes-i-j inner-path-n1 n1 n1)
		(adjacent-nodes-j-i inner-path-n1 n1 n1)

		(adjacent-nodes-i-j inner-path-n2 n2 n2)
		(adjacent-nodes-j-i inner-path-n2 n2 n2)

		(adjacent-nodes-i-j inner-path-n3 n3 n3)
		(adjacent-nodes-j-i inner-path-n3 n3 n3)

		(adjacent-nodes-i-j inner-path-n4 n4 n4)
		(adjacent-nodes-j-i inner-path-n4 n4 n4)

		; VIRTUAL NETWORK
		; All VMs instances of a VNF are placed in the same host node.

		; NETWORK SLICE 1 -> URLLC (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-1 smf0-1)
		(next-vnf smf0-1 upf0-1)
		; vnfs mappings
		(vnf-mapped-to amf0-1 n2) 
		(vnf-mapped-to smf0-1 n4)
		(vnf-mapped-to upf0-1 n2)
		;links mappings
		(link-mapped-to amf0-smf0-1 n2-n4)
		(link-mapped-to smf0-upf0-1 n2-n4)

		; NETWORK SLICE 2 -> urllc (SERVICE FUNCTION CHAIN)	
		(next-vnf amf0-2 smf0-2)
		(next-vnf smf0-2 upf0-2)
		; vnfs mappings
		(vnf-mapped-to amf0-2 n2)
		(vnf-mapped-to smf0-2 n2)
		(vnf-mapped-to upf0-2 n1)
		;links mappings
		(link-mapped-to amf0-smf0-2 inner-path-n2)
		(link-mapped-to smf0-upf0-2 n1-n2)

		; NETWORK SLICE 3 -> urllc (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-3 smf0-3)
		(next-vnf smf0-3 upf0-3)
		; vnfs mappings
		(vnf-mapped-to amf0-3 n4)
		(vnf-mapped-to smf0-3 n3)
		(vnf-mapped-to upf0-3 n3)
		;links mappings
		(link-mapped-to amf0-smf0-3 n3-n4)
		(link-mapped-to smf0-upf0-3 inner-path-n3)

		; NETWORK SLICE 4 -> URLLC (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-4 smf0-4)
		(next-vnf smf0-4 upf0-4)
		; vnfs mappings
		(vnf-mapped-to amf0-4 n4)
		(vnf-mapped-to smf0-4 n4)
		(vnf-mapped-to upf0-4 n1)
		;links mappings
		(link-mapped-to amf0-smf0-4 inner-path-n4)
		(link-mapped-to smf0-upf0-4 n1-n4)

		; NETWORK SLICE 5 -> urllc (SERVICE FUNCTION CHAIN)	
		(next-vnf amf0-5 smf0-5)
		(next-vnf smf0-5 upf0-5)
		; vnfs mappings
		(vnf-mapped-to amf0-5 n2)
		(vnf-mapped-to smf0-5 n2)
		(vnf-mapped-to upf0-5 n1)
		;links mappings
		(link-mapped-to amf0-smf0-5 inner-path-n2)
		(link-mapped-to smf0-upf0-5 n1-n2)

		; NETWORK SLICE 6 -> urllc (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-6 smf0-6)
		(next-vnf smf0-6 upf0-6)
		; vnfs mappings
		(vnf-mapped-to amf0-6 n4)
		(vnf-mapped-to smf0-6 n3)
		(vnf-mapped-to upf0-6 n3)
		;links mappings
		(link-mapped-to amf0-smf0-6 n3-n4)
		(link-mapped-to smf0-upf0-6 inner-path-n3)

		; AVAILABILITY OF RESOURCES IN SUBSTRATE
		(=(embedding-cpu n1) 76)
		(=(embedding-cpu n2) 40)
		(=(embedding-cpu n3) 64)
		(=(embedding-cpu n4) 52)

		(= (embedding-bandwidth n1-n2) 360) 
		(= (embedding-bandwidth n1-n3) 400)
		(= (embedding-bandwidth n2-n4) 360) 
		(= (embedding-bandwidth n3-n4) 360) 
		(= (embedding-bandwidth n1-n4) 380) 
		(= (embedding-bandwidth n2-n3) 400)
		(= (embedding-bandwidth inner-path-n1) 40000000)
		(= (embedding-bandwidth inner-path-n2) 40000000)
		(= (embedding-bandwidth inner-path-n3) 40000000)
		(= (embedding-bandwidth inner-path-n4) 40000000)
		)

	(:goal (and
			; CPU	
			(=(embedding-cpu n1)(embedding-cpu n2))
			(=(embedding-cpu n3)(embedding-cpu n4))

			; BANDWIDTH			
			(=(embedding-bandwidth n2-n4)(substrate-bandwidth-capacity))
			(=(embedding-bandwidth n1-n4)(substrate-bandwidth-capacity))
		)
	)
)
