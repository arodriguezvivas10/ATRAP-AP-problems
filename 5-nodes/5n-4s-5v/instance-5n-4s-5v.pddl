(define (problem instance-5n-4s-5v)

	(:domain domain-5n-4s-5v)

	(:objects
		; SUBSTRATE NETWORK
		; Physical Nodes
		n1 - node1
		n2 - node2
		n3 - node3
		n4 - node4
		n5 - node5
		; Physical Paths
		; All paths are bidirectionals
		n1-n2 - path-n1-n2
		n1-n3 - path-n1-n3
		n2-n4 - path-n2-n4
		n3-n4 - path-n3-n4
		n1-n4 - c-path-n1-n4
		n2-n3 - c-path-n2-n3
		n1-n5 - path-n1-n5
		n2-n5 - path-n2-n5
		n3-n5 - path-n3-n5
		n4-n5 - path-n4-n5
		inner-path-n1 - inner-path1
		inner-path-n2 - inner-path2
		inner-path-n3 - inner-path3
		inner-path-n4 - inner-path4
		inner-path-n5 - inner-path5

		; Network Slice 1 -> URLLC
		amf0-1 - amf0-ns1
		smf0-1 - smf0-ns1 
		upf0-1 - upf0-ns1
		amf1-1 - amf1-ns1
		smf1-1 - smf1-ns1
		amf0-smf0-1 - link-amf0-smf0-ns1
		smf0-upf0-1 - link-smf0-upf0-ns1
		upf0-amf1-1 - link-upf0-amf1-ns1
		amf1-smf1-1 - link-amf1-smf1-ns1

		; Network Slice 2 -> mMTC
		amf0-2 - amf0-ns2
		smf0-2 - smf0-ns2
		upf0-2 - upf0-ns2
		amf1-2 - amf1-ns2
		smf1-2 - smf1-ns2
		amf0-smf0-2 - link-amf0-smf0-ns2
		smf0-upf0-2 - link-smf0-upf0-ns2
		upf0-amf1-2 - link-upf0-amf1-ns2
		amf1-smf1-2 - link-amf1-smf1-ns2

		; Network Slice 3 -> eMBB
		amf0-3 - amf0-ns3
		smf0-3 - smf0-ns3
		upf0-3 - upf0-ns3
		amf1-3 - amf1-ns3
		smf1-3 - smf1-ns3
		amf0-smf0-3 - link-amf0-smf0-ns3
		smf0-upf0-3 - link-smf0-upf0-ns3
		upf0-amf1-3 - link-upf0-amf1-ns3
		amf1-smf1-3 - link-amf1-smf1-ns3

		; Network Slice 4 -> mMTC
		amf0-4 - amf0-ns4
		smf0-4 - smf0-ns4
		upf0-4 - upf0-ns4
		amf1-4 - amf1-ns4
		smf1-4 - smf1-ns4
		amf0-smf0-4 - link-amf0-smf0-ns4
		smf0-upf0-4 - link-smf0-upf0-ns4
		upf0-amf1-4 - link-upf0-amf1-ns4
		amf1-smf1-4 - link-amf1-smf1-ns4

		)

	(:init
		(=(substrate-cpu-capacity) 112) ; 4 CPUs x 28 cores
        (=(substrate-bandwidth-capacity) 200) ; 2*400Mbps
		(=(vnfs-required-cpu) 4.0)
        (=(required-bandwidth-urllc) 20)
        (=(scaling-factor) 4)

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

		(adjacent-nodes-i-j n1-n5 n1 n5)
		(adjacent-nodes-j-i n1-n5 n5 n1)

		(adjacent-nodes-i-j n2-n5 n2 n5)
		(adjacent-nodes-j-i n2-n5 n5 n2)

		(adjacent-nodes-i-j n3-n5 n3 n5)
		(adjacent-nodes-j-i n3-n5 n5 n3)

		(adjacent-nodes-i-j n4-n5 n4 n5)
		(adjacent-nodes-j-i n4-n5 n5 n4)

		(adjacent-nodes-i-j inner-path-n1 n1 n1)
		(adjacent-nodes-j-i inner-path-n1 n1 n1)

		(adjacent-nodes-i-j inner-path-n2 n2 n2)
		(adjacent-nodes-j-i inner-path-n2 n2 n2)

		(adjacent-nodes-i-j inner-path-n3 n3 n3)
		(adjacent-nodes-j-i inner-path-n3 n3 n3)

		(adjacent-nodes-i-j inner-path-n4 n4 n4)
		(adjacent-nodes-j-i inner-path-n4 n4 n4)

		(adjacent-nodes-i-j inner-path-n5 n5 n5)
		(adjacent-nodes-j-i inner-path-n5 n5 n5)

		; VIRTUAL NETWORK
		; All VMs instances of a VNF are placed in the same host node.

		; NETWORK SLICE 1 -> URLLC (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-1 smf0-1)
		(next-vnf smf0-1 upf0-1)
		(next-vnf upf0-1 amf1-1)
		(next-vnf amf1-1 smf1-1)
		; vnfs mappings
		(vnf-mapped-to amf0-1 n2) 
		(vnf-mapped-to smf0-1 n4)
		(vnf-mapped-to upf0-1 n2)
		(vnf-mapped-to amf1-1 n4)
		(vnf-mapped-to smf1-1 n3)
		;links mappings
		(link-mapped-to amf0-smf0-1 n2-n4)
		(link-mapped-to smf0-upf0-1 n2-n4)
		(link-mapped-to upf0-amf1-1 n2-n4)
		(link-mapped-to amf1-smf1-1 n3-n4)

		; NETWORK SLICE 2 -> mMTC (SERVICE FUNCTION CHAIN)	
		(next-vnf amf0-2 smf0-2)
		(next-vnf smf0-2 upf0-2)
		(next-vnf upf0-2 amf1-2)
		(next-vnf amf1-2 smf1-2)
		; vnfs mappings
		(vnf-mapped-to amf0-2 n2)
		(vnf-mapped-to smf0-2 n5)
		(vnf-mapped-to upf0-2 n1)
		(vnf-mapped-to amf1-2 n4)
		(vnf-mapped-to smf1-2 n5)
		;links mappings
		(link-mapped-to amf0-smf0-2 n2-n5)
		(link-mapped-to smf0-upf0-2 n1-n5)
		(link-mapped-to upf0-amf1-2 n1-n4)
		(link-mapped-to amf1-smf1-2 n4-n5)

		; NETWORK SLICE 3 -> eMBB (SERVICE FUNCTION CHAIN)
		(next-vnf amf0-3 smf0-3)
		(next-vnf smf0-3 upf0-3)
		(next-vnf upf0-3 amf1-3)
		(next-vnf amf1-3 smf1-3)
		; vnfs mappings
		(vnf-mapped-to amf0-3 n2) 
		(vnf-mapped-to smf0-3 n3)
		(vnf-mapped-to upf0-3 n2)
		(vnf-mapped-to amf1-3 n4)
		(vnf-mapped-to smf1-3 n3)
		;links mappings
		(link-mapped-to amf0-smf0-3 n2-n3)
		(link-mapped-to smf0-upf0-3 n2-n4)
		(link-mapped-to upf0-amf1-3 n2-n4)
		(link-mapped-to amf1-smf1-3 n3-n4)

		; NETWORK SLICE 4 -> mMTC (SERVICE FUNCTION CHAIN)	
		(next-vnf amf0-4 smf0-4)
		(next-vnf smf0-4 upf0-4)
		(next-vnf upf0-4 amf1-4)
		(next-vnf amf1-4 smf1-4)
		; vnfs mappings
		(vnf-mapped-to amf0-4 n2)
		(vnf-mapped-to smf0-4 n5)
		(vnf-mapped-to upf0-4 n1)
		(vnf-mapped-to amf1-4 n3)
		(vnf-mapped-to smf1-4 n5)
		;links mappings
		(link-mapped-to amf0-smf0-4 n2-n5)
		(link-mapped-to smf0-upf0-4 n1-n5)
		(link-mapped-to upf0-amf1-4 n1-n4)
		(link-mapped-to amf1-smf1-4 n3-n5)

		; AVAILABILITY OF RESOURCES IN SUBSTRATE
		(=(embedding-cpu n1) 80)
		(=(embedding-cpu n2) 16)
		(=(embedding-cpu n3) 48)
		(=(embedding-cpu n4) 48)
		(=(embedding-cpu n5) 48)

		(= (embedding-bandwidth n1-n2) 200)
		(= (embedding-bandwidth n1-n3) 200)
		(= (embedding-bandwidth n2-n4) 100)
		(= (embedding-bandwidth n3-n4) 160)
		(= (embedding-bandwidth n1-n4) 160)
		(= (embedding-bandwidth n2-n3) 180)
		(= (embedding-bandwidth n1-n5) 160)
		(= (embedding-bandwidth n2-n5) 160)
		(= (embedding-bandwidth n3-n5) 180)
		(= (embedding-bandwidth n4-n5) 180)
		(= (embedding-bandwidth inner-path-n1) 40000000)
		(= (embedding-bandwidth inner-path-n2) 40000000)
		(= (embedding-bandwidth inner-path-n3) 40000000)
		(= (embedding-bandwidth inner-path-n4) 40000000)
		(= (embedding-bandwidth inner-path-n5) 40000000)
		)

	(:goal (and
			; CPU	
			(>(embedding-cpu n2)16)
			(<(embedding-cpu n1)80)

			; BANDWIDTH
			;(<(embedding-bandwidth n1-n2)(substrate-bandwidth-capacity))
			;(<(embedding-bandwidth n1-n3)(substrate-bandwidth-capacity))
			(>(embedding-bandwidth n2-n4)100)
		)
	)
	)
